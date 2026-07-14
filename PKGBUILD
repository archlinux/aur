# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Michel Brabants <michel.brabants@euphonynet.be>

pkgname=libzrtpcpp
pkgver=4.7.0
pkgrel=4
pkgdesc="A C++ implementation of Phil Zimmermann's ZRTP specification"
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/wernerd/ZRTPCPP'
license=('Apache-2.0')
depends=('ccrtp')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz"
        type_fix.patch
        fix-emoji-handling.patch)
b2sums=('ffa8bb3c4a18cacf5aa0da08dcbbef225564bece3f282308352d7c3dffc2265815fac287fe219d991acde2a4745fefb750bc634708f1fe26866dd2cb4f5ebc56'
        '6c599f893815aa550d5c3de41470e0b7f72b76dd259baa918b1269353b387ef8732a6b8c0fb0d014f4e6b68f07284dbf8e0388b51cc1ba17c875671076c8dc56'
        'da66e19e58261763ce3bc758727e13ef7c9abe2751e40e31529b2bdf5485ba0636f4048bed0c495d8501e66e57e87fd8fe2a69fbc9180dc859ef6ab8ebdfbd69')

prepare() {
    sed 's/lib64/lib/g' -i ZRTPCPP-${pkgver}/CMakeLists.txt
    patch -Np2 -i type_fix.patch
    patch -Np1 -i fix-emoji-handling.patch
}

build() {
    mkdir -p build
    cd build
    cmake ../ZRTPCPP-${pkgver} \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build .
}

package() {
    cmake --install build --prefix "${pkgdir}"/usr
}
