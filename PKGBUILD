# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=linphone-plugin-msamr
_pkgname=msamr
pkgver=1.1.3
pkgrel=1
pkgdesc="Mediastreamer2 plugin for AMR codec"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL3')
depends=('opencore-amr')
makedepends=('cmake')
source=("https://gitlab.linphone.org/BC/public/msamr/-/archive/$pkgver/msamr-$pkgver.tar.gz")
sha256sums=('08e67986389a03246d0891715e354778986275c675012947526e8029e7454b32')

build() {
    cd "${srcdir}"
    mkdir -p build
    cd build
    cmake -DCMAKE_PREFIX_PATH="/usr" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DENABLE_STATIC="NO" "../$_pkgname-$pkgver"
    make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
