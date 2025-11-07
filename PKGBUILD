# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>

_plug=edgemasks
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=3.1.0.gd0a1fcd
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/HolyWu/VapourSynth-EdgeMasks'
license=('MIT')
depends=(
  'vapoursynth'
)
makedepends=(
  'git'
  'meson'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HolyWu/VapourSynth-EdgeMasks.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

build() {
  arch-meson "${_plug}" build \
    --buildtype=release \
    --libdir /usr/lib/vapoursynth

  meson compile -C build
}

package(){
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}