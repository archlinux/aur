# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=zsmooth
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.13
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug}"
arch=('x86_64')
url='https://github.com/adworacz/zsmooth'
license=('MIT')
depends=('vapoursynth')
makedepends=('zig')
source=("https://github.com/adworacz/zsmooth/archive/refs/tags/0.13.tar.gz")
sha256sums=('fd1c1558c51f097d8c18c2399935eda5c47944563671ca0a6158696d6c8b973f')

build() {
    cd "zsmooth-0.13"
    zig build -Doptimize=ReleaseFast
}

package() {
    cd "zsmooth-0.13"

    install -Dm755 zig-out/lib/libzsmooth.so "${pkgdir}/usr/lib/vapoursynth/libzsmooth.so"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/LICENSE"
}
