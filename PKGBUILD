# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=xvs
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r4.75877c8
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/xyx98/my-vapoursynth-script'
license=('GPL')
depends=('vapoursynth-plugin-muvsfunc-git'
         # vsfiltermod not work in linux :( https://github.com/sorayuki/VSFilterMod
         'vapoursynth-plugin-tdeintmod-git'
         'vapoursynth-plugin-dpid-git'
         'vapoursynth-plugin-tonemap-git'
         'vapoursynth-plugin-ffms2-git'
         'vapoursynth-plugin-lsmashsource-git'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/xyx98/my-vapoursynth-script.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
#   echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "${_plug}"
  install -Dm644 xvs.py "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}
