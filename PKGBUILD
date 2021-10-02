# Maintainer:  Joshua Holmer <jholmer.in@gmail.com>

_plug=vivtc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=R1.2.ged56d96
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/vapoursynth/vivtc'
license=('MIT')
depends=('vapoursynth')
makedepends=('git'
  'meson'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/vapoursynth/vivtc.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
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

  install -Dm644 "${_plug}/docs/vivtc.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.rst"
}
