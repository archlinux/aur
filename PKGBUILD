# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vszip
pkgname=vapoursynth-plugin-${_plug}
pkgver=r5
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug}"
arch=('x86_64')
url='https://github.com/dnjulek/vapoursynth-zip'
license=('MIT')
depends=('vapoursynth')
makedepends=('zig-nightly-bin')
source=("https://github.com/dnjulek/vapoursynth-zip/archive/refs/tags/R5.tar.gz")
sha256sums=('990b481af94bd295de6453abc2e9f6e5eb3664a62eaddaf9b41041cf2de7b819')

build() {
    cd "vapoursynth-zip-R5"
    zig build -Doptimize=ReleaseFast
}

package() {
    cd "vapoursynth-zip-R5"

    install -Dm755 zig-out/lib/libvszip.so "${pkgdir}/usr/lib/vapoursynth/libvszip.so"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
