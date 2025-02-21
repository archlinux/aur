# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=rockchip-mpp
pkgver=1.0.8
pkgrel=1
epoch=1
pkgdesc='Rockchip Media Process Platform (MPP)'
arch=('x86_64')
url='https://github.com/rockchip-linux/mpp/'
license=('Apache-2.0' 'MIT')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://github.com/rockchip-linux/mpp/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6bdae04719ac3d5e2ba38e105f9f8649ebf5336418bed17616580311cfbfb927')

build() {
    cmake -B build -S "mpp-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_VPROC_VDPP:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "mpp-${pkgver}/LICENSES/MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
