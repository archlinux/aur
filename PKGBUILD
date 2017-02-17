# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=plum
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r48.2778b04
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=173775'
license=('GPL')
depends=('vapoursynth'
         'vapoursynth-plugin-knlmeanscl'
         'vapoursynth-plugin-fmtconv'
         'vapoursynth-plugin-nnedi3-git'
         'vapoursynth-plugin-vcfreq'
         'vapoursynth-plugin-mvtools_sf-git'
         'vapoursynth-plugin-dfttest-git'
         'vapoursynth-plugin-bm3d-git'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/IFeelBloated/Plum.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "${_plug}"
  install -Dm644 Plum.py "${pkgdir}${_site_packages}/Plum.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/Plum.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/Plum.py"
}
