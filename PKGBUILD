# Maintainer: witchymary

_plug=equalizehist
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r15.fe411da
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/witchymary/VapourSynth-EqualizeHist'
license=('MIT')
depends=('vapoursynth'
         'opencv')
makedepends=('git'
             'make')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/witchymary/VapourSynth-EqualizeHist.git")
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
