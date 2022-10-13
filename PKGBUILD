# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libva-nvidia-driver
pkgver=0.0.7
pkgrel=1
pkgdesc='VA-API implementation that uses NVDEC as a backend'
arch=('x86_64')
url='https://github.com/elFarto/nvidia-vaapi-driver/'
license=('MIT')
depends=('gst-plugins-bad-libs' 'libegl')
makedepends=('meson' 'ffnvcodec-headers' 'libva')
conflicts=('libva-vdpau-driver')
source=("https://github.com/elFarto/nvidia-vaapi-driver/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c19e35d41cd39a93c2a1af99065d51719a994fdd89f8b0716914cba7e716718e')

build() {
    arch-meson "nvidia-vaapi-driver-${pkgver}" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    install -D -m644 "nvidia-vaapi-driver-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
