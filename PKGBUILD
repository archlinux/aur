# Maintainer:  Joshua Holmer <jholmer.in@gmail.com>

_plug=removegrain
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=R1.4.gea3d156
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}/rgvs (GIT version)"
arch=('any')
url='https://github.com/vapoursynth/vs-removegrain'
license=('MIT')
depends=('vapoursynth')
makedepends=('git'
  'meson'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/vapoursynth/vs-removegrain.git")
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

  install -Dm644 "${_plug}/docs/rgvs.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.rst"
}
