# Maintainer:  Joshua Holmer <jholmer.in@gmail.com>

_plug=jincresize
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r7.2.5.ga557614
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Kiyamou/VapourSynth-JincResize'
license=('MIT')
depends=('vapoursynth')
makedepends=('git'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Kiyamou/VapourSynth-JincResize.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
#  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  arch-meson "../${_plug}" --libdir /usr/lib/vapoursynth
  ninja
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
