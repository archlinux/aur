# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vszip
pkgname=vapoursynth-plugin-${_plug}
pkgver=r3
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug}"
arch=('x86_64')
url='https://github.com/dnjulek/vapoursynth-zip'
license=('MIT')
depends=('vapoursynth')
makedepends=('zig-nightly-bin')
source=("https://github.com/dnjulek/vapoursynth-zip/archive/refs/tags/R3.tar.gz")
sha256sums=('7cbad7da8106e5600f4b91f149dd3dcc10ca071cf5c48f5548929b58a8b09a9c')

build() {
    cd "vapoursynth-zip-R3"
    zig build -Doptimize=ReleaseFast
}

package() {
    cd "vapoursynth-zip-R3"

    install -Dm755 zig-out/lib/libvszip.so "${pkgdir}/usr/lib/vapoursynth/libvszip.so"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
