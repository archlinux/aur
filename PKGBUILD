# Maintainer: K1412 <FD.K1412@openaliasbox.org>
pkgname=schema2ldif
pkgver=1.3
pkgrel=1
pkgdesc="Convert .schema to .ldif." 
arch=('any')
url='https://forge.fusiondirectory.org/projects/schema2ldif'
license=('BSD')

source=("http://repos.fusiondirectory.org/sources/schema2ldif/{pkgname}-${pkgver}.tar.gz"
        'default-path-for-ldap-schema-manager.patch')
md5sums=('bc4639b540f210a6afcf114fdfae56b6'
         '35cab7886fe2fd592e414099db1d500d')

prepare() {
  # In srcdir
  cd ${pkgname}-${pkgver}/

  # Apply patchs
  patch -p1 -i ../default-path-for-ldap-schema-manager.patch
}

package() {
  cd ${pkgname}-${pkgver}/

  mkdir -p ${pkgdir}/usr/bin/
  cp ./bin/schema2ldif ${pkgdir}/usr/bin/
  cp ./bin/ldap-schema-manager ${pkgdir}/usr/bin/

  mkdir -p ${pkgdir}/usr/share/man/man1/
  gzip ./man/schema2ldif.1
  gzip ./man/ldap-schema-manager.1
  cp ./man/schema2ldif.1.gz ${pkgdir}/usr/share/man/man1/
  cp ./man/ldap-schema-manager.1.gz ${pkgdir}/usr/share/man/man1/

  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/
  cp ./LICENSE ${pkgdir}/usr/share/doc/${pkgname}/
}

