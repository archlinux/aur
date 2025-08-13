# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vszip
pkgname=vapoursynth-plugin-${_plug}
pkgver=r9
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug}"
arch=('x86_64')
url='https://github.com/dnjulek/vapoursynth-zip'
license=('MIT')
depends=('vapoursynth')
# FIXME: Specifically we need zig 0.14 but I'm not aware of a way to lock the version using PKGBUILD
makedepends=('zig-bin')
source=("https://github.com/dnjulek/vapoursynth-zip/archive/refs/tags/R9.tar.gz")
sha256sums=('ca0c98d3a15a1f56b85730b0d16d3781bb8688e87c7bbda7d948d8cfc0ffe625')

build() {
    cd "vapoursynth-zip-R9"
    zig build -Doptimize=ReleaseFast
}

package() {
    cd "vapoursynth-zip-R9"

    install -Dm755 zig-out/lib/libvszip.so "${pkgdir}/usr/lib/vapoursynth/libvszip.so"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
