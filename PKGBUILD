# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=zsmooth
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.11
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug}"
arch=('x86_64')
url='https://github.com/adworacz/zsmooth'
license=('MIT')
depends=('vapoursynth')
makedepends=('zig-bin')
source=("https://github.com/adworacz/zsmooth/archive/refs/tags/0.11.tar.gz")
sha256sums=('35a8d2feb9fc921c7f04895fc55cd3a6954ce41cae4781361e69338fbd02a325')

build() {
    cd "zsmooth-0.11"
    zig build -Doptimize=ReleaseFast
}

package() {
    cd "zsmooth-0.11"

    install -Dm755 zig-out/lib/libzsmooth.so "${pkgdir}/usr/lib/vapoursynth/libzsmooth.so"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/LICENSE"
}
