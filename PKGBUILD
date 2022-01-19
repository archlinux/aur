# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libva-nvidia-driver
pkgver=0.0.2
pkgrel=1
pkgdesc='VA-API implementation that uses NVDEC as a backend'
arch=('x86_64')
url='https://github.com/elFarto/nvidia-vaapi-driver/'
license=('MIT')
depends=('gst-plugins-bad-libs' 'libegl')
makedepends=('meson' 'ffnvcodec-headers' 'libva')
source=("https://github.com/elFarto/nvidia-vaapi-driver/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
conflicts=('libva-vdpau-driver')
sha256sums=('37ad7d725c3b2bf8e2d43dadbdc6ce36ab69927e315998fc76d3820ab3efc74b')

build() {
    arch-meson "nvidia-vaapi-driver-${pkgver}" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    install -D -m644 "nvidia-vaapi-driver-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
