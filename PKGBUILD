# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: ovi chis <ovi@ovios.org>

pkgname=libqb
pkgver=1.0.2
pkgrel=1
pkgdesc='Library with the primary purpose of providing high performance client server reusable features'
arch=("i686" "x86_64" "mips64el")
makedepends=("doxygen" "splint")
license=("LGPL2.1")
options=(!libtool)
url="https://github.com/ClusterLabs/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ClusterLabs/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('6991719cc860f2596254697a7cd568dfe90653987332e71e4278f2a9d74b351e02fd77cbd65372f56d93594ace5f781ea84d5c480969f8f6e837ff506f701ee1')

build() {
cd "${srcdir}/${pkgname}-${pkgver}"
  setarch ${CARCH} ./autogen.sh
  setarch ${CARCH} ./configure --prefix=/usr\
    --disable-fatal-warnings\
    --disable-static\
    --libdir=/usr/lib\
    --sbindir=/usr/bin
  setarch ${CARCH} make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  setarch ${CARCH} make DESTDIR="${pkgdir}" install
}
