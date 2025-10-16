# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>

_plug=zsmooth
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r410.811e14b
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/adworacz/zsmooth'
license=('MIT')
depends=('vapoursynth')
makedepends=('zig')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/adworacz/zsmooth.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "zsmooth"
    zig build -Doptimize=ReleaseFast
}

package() {
    cd "zsmooth"
    install -Dm755 zig-out/lib/libzsmooth.so "${pkgdir}/usr/lib/vapoursynth/libzsmooth.so"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/LICENSE"
}