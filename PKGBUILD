# Maintainer: cagedbird043 <cagedbird043@gmail.com>

pkgname=libva-nvidia-driver-cagedbird
_tag=v0.0.18-cb2
pkgver=0.0.18.cb2
pkgrel=1
pkgdesc='VA-API driver on NVDEC/NVENC with hardware encode and Chrome support (cagedbird043 fork)'
arch=('x86_64')
url='https://github.com/cagedbird043/nvidia-vaapi-driver'
license=('MIT')
depends=('gst-plugins-bad-libs' 'libegl' 'nvidia-utils')
makedepends=('meson' 'ffnvcodec-headers' 'libva')
provides=('libva-nvidia-driver')
conflicts=('libva-nvidia-driver' 'libva-vdpau-driver')
source=("nvidia-vaapi-driver-${_tag}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('7e091dac39617df606d6a7733dd4c6ae3dc70f4c973c4d7296673986e74e4af0')

build() {
    arch-meson "nvidia-vaapi-driver-${_tag#v}" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -D -m644 "nvidia-vaapi-driver-${_tag#v}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
