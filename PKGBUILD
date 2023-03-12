# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libva-nvidia-driver
pkgver=0.0.9
pkgrel=1
pkgdesc='VA-API implementation that uses NVDEC as a backend'
arch=('x86_64')
url='https://github.com/elFarto/nvidia-vaapi-driver/'
license=('MIT')
depends=('gst-plugins-bad-libs' 'libegl')
makedepends=('meson' 'ffnvcodec-headers' 'libva')
conflicts=('libva-vdpau-driver')
source=("https://github.com/elFarto/nvidia-vaapi-driver/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4d14302be650bb63a701b61062d31fa70bfef2f622f3b1f52c93fb9cab6ae698')

build() {
    arch-meson "nvidia-vaapi-driver-${pkgver}" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -D -m644 "nvidia-vaapi-driver-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
