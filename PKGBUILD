# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=adjust
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v2.2.0.ga3c8d23
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=171956"
license=('custom:WTFPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dubhater/vapoursynth-${_plug}.git"
        'http://www.wtfpl.net/txt/copying')
sha1sums=('SKIP'
          '337ece375beddfdb7392699fd00eb9b3e823d03f')
_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}


package(){
  cd "${_plug}"
  install -Dm644 adjust.py "${pkgdir}${_site_packages}/adjust.py"
  install -Dm644 readme.rst "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.rst"
  install -Dm644 ../copying "${pkgdir}/usr/share/licenses/${pkgname}/copying"
}
