# Maintainer:  Joshua Holmer <jholmer.in@gmail.com>

_plug=chickendream
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r2.1.ga59183f
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/EleonoreMizo/chickendream'
license=('MIT')
depends=('vapoursynth')
makedepends=('git'
  'autogen'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/EleonoreMizo/chickendream.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd "${_plug}/build/unix"
  chmod +x autogen.sh
  ./autogen.sh
  ./configure
  make
}

package() {
  mkdir -p "${pkgdir}/usr/lib/vapoursynth/"
  cp "${_plug}/build/unix/.libs/libchickendream.so" "${pkgdir}/usr/lib/vapoursynth/"
}
