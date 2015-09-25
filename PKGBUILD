# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=dither
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r19.0f209b6
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
sha1sums=('SKIP')

_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  install -Dm644 "${_plug}/Dither.py" "${pkgdir}${_sites_packages}/Dither.py"
}

