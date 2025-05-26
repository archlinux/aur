# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vszip
pkgname=vapoursynth-plugin-${_plug}
pkgver=r7
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug}"
arch=('x86_64')
url='https://github.com/dnjulek/vapoursynth-zip'
license=('MIT')
depends=('vapoursynth')
# FIXME: Specifically we need zig 0.14 but I'm not aware of a way to lock the version using PKGBUILD
makedepends=('zig-bin')
source=("https://github.com/dnjulek/vapoursynth-zip/archive/refs/tags/R7.tar.gz")
sha256sums=('30ae55a7bc82ce2348af7ed3702e3ace08b4e68be8eb5d2ae9850e5e8dc2926e')

build() {
    cd "vapoursynth-zip-R7"
    zig build -Doptimize=ReleaseFast
}

package() {
    cd "vapoursynth-zip-R7"

    install -Dm755 zig-out/lib/libvszip.so "${pkgdir}/usr/lib/vapoursynth/libvszip.so"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
