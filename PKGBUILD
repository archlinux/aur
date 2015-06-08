# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Maxime Gauduin <alucryd@gmail.com>

_plug=temporalsoften2
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v0.1.1.0.g7c72c4d
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=166769'
license=('LGPL2.1')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/alucryd/vapoursynth-${_plug}.git")
md5sums=('SKIP')
_gitname="${_plug}"
_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"


pkgver() {
  cd "${_gitname}"
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd "${_gitname}"
  pwd
  ./configure --install="${pkgdir}/usr/lib/vapoursynth"
  make
}

package(){
  cd "${_gitname}"
  make install
  install -Dm644 temporalsoften2.py "${pkgdir}${_sites_packages}/temporalsoften2.py"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}

