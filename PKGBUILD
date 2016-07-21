# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vine
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r33.1fa81a7
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=173703'
license=('LGPL2.1')
depends=('vapoursynth-plugin-knlmeanscl'
         'vapoursynth-plugin-flt-git'
         'vapoursynth-plugin-tcanny-git'
         'vapoursynth-plugin-fmtconv'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/IFeelBloated/Vine.git")
sha1sums=('SKIP')

_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "${_plug}"
  install -Dm644 Vine.py "${pkgdir}${_sites_packages}/Vine.py"
}
