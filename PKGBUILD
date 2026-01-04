# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>

_plug=awarp
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=2.0.gb3f2fc8
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/HolyWu/VapourSynth-AWarp'
license=('MIT')
depends=(
  'vapoursynth'
)
makedepends=(
  'git'
  'meson'
  'ninja'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HolyWu/VapourSynth-AWarp.git")
sha256sums=('SKIP')

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
