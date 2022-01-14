# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=linphone-plugin-msamr
_pkgname=msamr
pkgver=1.1.3
pkgrel=2
pkgdesc="Mediastreamer2 plugin for AMR codec"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL3')
depends=('mediastreamer2'
    'opencore-amr'
    'ortp')
makedepends=('cmake')
source=("https://gitlab.linphone.org/BC/public/msamr/-/archive/$pkgver/msamr-$pkgver.tar.gz"
    cmake.patch)
sha256sums=('08e67986389a03246d0891715e354778986275c675012947526e8029e7454b32'
            '14b422b1400a63184760ce1c3039863594e96a24607d499aeb23688adfd18e84')

prepare() {
    cd "$_pkgname-$pkgver"
    patch -p1 -i ../cmake.patch
}

build() {
    cmake -B build "$_pkgname-$pkgver" \
        -DCMAKE_PREFIX_PATH="/usr" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DENABLE_STATIC="NO" \
        -Wno-dev
    make -C build
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}
