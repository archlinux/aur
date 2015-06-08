# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=dither
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=20150223.0f209b6
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='http://forum.doom9.org/showthread.php?t=171525'
license=('GPL')
depends=('vapoursynth' 'vapoursynth-plugin-fmtconv')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/IFeelBloated/VaporSynth-Functions.git")
md5sums=('SKIP')
_gitname="${_plug}"
_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_gitname}"
  #echo "$(git describe --long --tags | tr - .)"
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

package(){
  cd "${_gitname}"
  install -Dm644 Dither.py "${pkgdir}${_sites_packages}/Dither.py"
}

