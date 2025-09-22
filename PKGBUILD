# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vszip
pkgname=vapoursynth-plugin-${_plug}
pkgver=r10
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug}"
arch=('x86_64')
url='https://github.com/dnjulek/vapoursynth-zip'
license=('MIT')
depends=('vapoursynth')
makedepends=('zig')
source=("https://github.com/dnjulek/vapoursynth-zip/archive/refs/tags/R10.tar.gz")
sha256sums=('c145cbe02382e7fd6c72cfabb5afa9add0eb3e687a895aeeed24acadfc98b14a')

build() {
    cd "vapoursynth-zip-R10"
    zig build -Doptimize=ReleaseFast
}

package() {
    cd "vapoursynth-zip-R10"

    install -Dm755 zig-out/lib/libvszip.so "${pkgdir}/usr/lib/vapoursynth/libvszip.so"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
