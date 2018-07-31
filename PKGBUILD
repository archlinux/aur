# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=slapi-nis
pkgver=0.56.2
pkgrel=1
pkgdesc="NIS Server and Schema Compatibility plugins for Directory Server"
arch=(i686 x86_64)
url="https://pagure.io/slapi-nis"
license=(GPL)
makedepends=(rpcsvc-proto)
depends=(389-ds-base sssd openldap tcp-wrappers)
source=("https://releases.pagure.org/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "https://releases.pagure.org/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('6650bcfce93700dc0c4672281784fdcbefed37ec175bb23ede2ed6078690090272f0ba9860e905c53f514e7628f04d698f5dfba9633c29f2285312d295039be6'
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
