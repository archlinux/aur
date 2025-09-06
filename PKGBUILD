# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=zsmooth
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.12
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug}"
arch=('x86_64')
url='https://github.com/adworacz/zsmooth'
license=('MIT')
depends=('vapoursynth')
makedepends=('zig')
source=("https://github.com/adworacz/zsmooth/archive/refs/tags/0.12.tar.gz")
sha256sums=('87a0375541aca05eadfd1ac0dd90207110173e08a0a036f5119d63af577a8e2d')

build() {
    cd "zsmooth-0.12"
    zig build -Doptimize=ReleaseFast
}

package() {
    cd "zsmooth-0.12"

    install -Dm755 zig-out/lib/libzsmooth.so "${pkgdir}/usr/lib/vapoursynth/libzsmooth.so"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/LICENSE"
}
