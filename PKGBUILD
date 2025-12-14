# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vszip
pkgname=vapoursynth-plugin-${_plug}
pkgver=r11
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug}"
arch=('x86_64')
url='https://github.com/dnjulek/vapoursynth-zip'
license=('MIT')
depends=('vapoursynth')
makedepends=('zig')
source=("https://github.com/dnjulek/vapoursynth-zip/archive/refs/tags/R11.tar.gz")
sha256sums=('a390a964c92954486686b8d8f00971840692bc03d48f938dad74cdbeb89a52f7')

build() {
    cd "vapoursynth-zip-R11"
    zig build -Doptimize=ReleaseFast
}

package() {
    cd "vapoursynth-zip-R11"

    install -Dm755 zig-out/lib/libvszip.so "${pkgdir}/usr/lib/vapoursynth/libvszip.so"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
