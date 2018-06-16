# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=mvtools
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v19.3.g17af517
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url="http://forum.doom9.org/showthread.php?t=171207"
license=('GPL')
depends=('vapoursynth'
         'fftw'
         )
makedepends=('git'
             'nasm'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dubhater/vapoursynth-${_plug}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd build
  arch-meson "../${_plug}" \
    --libdir /usr/lib/vapoursynth

}

build() {
  ninja -C build
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 "${_plug}/readme.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.rst"
}
