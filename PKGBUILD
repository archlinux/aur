# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=slapi-nis
pkgver=0.56.3
pkgrel=1
pkgdesc="NIS Server and Schema Compatibility plugins for Directory Server"
arch=(i686 x86_64)
url="https://pagure.io/slapi-nis"
license=(GPL)
makedepends=(rpcsvc-proto)
depends=(389-ds-base sssd openldap tcp-wrappers)
source=("https://releases.pagure.org/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "https://releases.pagure.org/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('9346a90f188bd2d25c1fb403a0a4e5d0cde16af013d2ab6270f66b810ee4c96deb182c62a434ae7ba138c2c5341d1b828fa1db4abbdfa1c287947d02ec4a2378'
            'SKIP')
validpgpkeys=(0E3F7F5E41BA4F0B010B3618252F74950A10D5A8)

build() {
  cd "${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --disable-static \
    --with-tcp-wrappers \
    --with-ldap=openldap

  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
