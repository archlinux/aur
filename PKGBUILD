# Maintainer: witchymary

_plug=planestatsmod
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r17.4b86d3b
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/witchymary/VapourSynth-PlaneStatsMod'
license=('MIT')
depends=('vapoursynth')
makedepends=('git'
             'make')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/witchymary/VapourSynth-PlaneStatsMod.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
#   echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_plug
  make
}

package(){
  cd "${srcdir}/${_plug}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${_plug}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
