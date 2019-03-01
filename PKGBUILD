# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=oyster
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r137.54fe6c3
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://forum.doom9.org/showthread.php?t=173470'
license=('LGPL2.1')
depends=('vapoursynth'
         'vapoursynth-plugin-bm3d-git'
         'vapoursynth-plugin-knlmeanscl-git'
         'vapoursynth-plugin-fmtconv-git'
         'vapoursynth-plugin-msmoosh-git'
         'vapoursynth-plugin-mvtools_sf-git'
         'vapoursynth-plugin-nnedi3-git'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/IFeelBloated/Oyster.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "${_plug}"
  install -Dm644 Oyster.py "${pkgdir}${_site_packages}/Oyster.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/Oyster.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/Oyster.py"
}
