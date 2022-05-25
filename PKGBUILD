# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libva-nvidia-driver
pkgver=0.0.6
pkgrel=1
pkgdesc='VA-API implementation that uses NVDEC as a backend'
arch=('x86_64')
url='https://github.com/elFarto/nvidia-vaapi-driver/'
license=('MIT')
depends=('gst-plugins-bad-libs' 'libegl')
makedepends=('meson' 'ffnvcodec-headers' 'libva')
conflicts=('libva-vdpau-driver')
source=("https://github.com/elFarto/nvidia-vaapi-driver/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8a64c069200750f12d013c79547e459cbb87b498357478c5f36cb97f710294e0')

build() {
    arch-meson "nvidia-vaapi-driver-${pkgver}" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    install -D -m644 "nvidia-vaapi-driver-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
