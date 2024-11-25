# Maintainer: Alessio Artoni <alessio@artoni.org>
# Contributor: K1412 <FD.K1412@openaliasbox.org>
pkgname=schema2ldif
pkgver=1.3
pkgrel=2
pkgdesc='Convert .schema to .ldif.'
arch=('any')
provides=('schema2ldif' 'ldap-schema-manager')
conflicts=('schema2ldif' 'ldap-schema-manager')
url='https://github.com/aartoni/schema2ldif'
license=('BSD-3-Clause')
source=("$url/archive/refs/tags/$pkgver.tar.gz"
        'default-path-for-ldap-schema-manager.patch')
b2sums=('cb19581e765919ec323052b6087b2fd3966473ec1683abe720603df1d5937cc47366bf53cda5eb4354b5b1440ee13bef05f68f08e77308032de4d1af4bf1b6f5'
        '28c6efd90e7dd4973a1c674e348b685036b523c06daf8868db99bc705277b43786322417376959690cc315ac68baccf5872e264e24f0a8270ac8066f71fd8ef0')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i ../default-path-for-ldap-schema-manager.patch
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  cp ./bin/schema2ldif "$pkgdir/usr/bin"
  cp ./bin/ldap-schema-manager "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/usr/share/man/man1"
  gzip ./man/schema2ldif.1
  gzip ./man/ldap-schema-manager.1
  cp ./man/schema2ldif.1.gz "$pkgdir/usr/share/man/man1"
  cp ./man/ldap-schema-manager.1.gz "$pkgdir/usr/share/man/man1"

  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  cp ./LICENSE "$pkgdir/usr/share/doc/$pkgname"
}
