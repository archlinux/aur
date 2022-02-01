# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libva-nvidia-driver
pkgver=0.0.4
pkgrel=1
pkgdesc='VA-API implementation that uses NVDEC as a backend'
arch=('x86_64')
url='https://github.com/elFarto/nvidia-vaapi-driver/'
license=('MIT')
depends=('gst-plugins-bad-libs' 'libegl')
makedepends=('meson' 'ffnvcodec-headers' 'libva')
source=("https://github.com/elFarto/nvidia-vaapi-driver/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
conflicts=('libva-vdpau-driver')
sha256sums=('8b99c618f530ea388964cdb3e8454de2d89f4354de8d0a0ea7941e88576d7e2a')

build() {
    arch-meson -Dav1='true' "nvidia-vaapi-driver-${pkgver}" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    install -D -m644 "nvidia-vaapi-driver-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
