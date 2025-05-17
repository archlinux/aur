# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vszip
pkgname=vapoursynth-plugin-${_plug}
pkgver=r6
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug}"
arch=('x86_64')
url='https://github.com/dnjulek/vapoursynth-zip'
license=('MIT')
depends=('vapoursynth')
# FIXME: Specifically we need zig 0.14 but I'm not aware of a way to lock the version using PKGBUILD
makedepends=('zig-bin')
source=("https://github.com/dnjulek/vapoursynth-zip/archive/refs/tags/R6.tar.gz")
sha256sums=('9196cda36dedcb82cb33bd7d3f08fa34ab9216228b471eacced8100673acbfb9')

build() {
    cd "vapoursynth-zip-R6"
    zig build -Doptimize=ReleaseFast
}

package() {
    cd "vapoursynth-zip-R6"

    install -Dm755 zig-out/lib/libvszip.so "${pkgdir}/usr/lib/vapoursynth/libvszip.so"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
