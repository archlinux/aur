# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=slapi-nis
pkgver=0.56.1
pkgrel=1
pkgdesc="NIS Server and Schema Compatibility plugins for Directory Server"
arch=(i686 x86_64)
url="https://pagure.io/slapi-nis"
license=(GPL)
depends=(389-ds-base libtirpc nspr nss openldap tcp-wrappers)
options=(!libtool)
source=("https://releases.pagure.org/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "https://releases.pagure.org/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('9a3f58f71e59671969040bf48754f315acf09762c2d4a21c3c176ac9d427bf795c4e85570f23d5caf4879512a4dad3ffc128c9dd28a851a89c494ad77ac08152'
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
