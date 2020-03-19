# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=g41fun
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v0.5.alpha.0.g6074ced
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url="https://github.com/dubhater/vapoursynth-${_plug}"
license=('apache')
depends=('vapoursynth-plugin-havsfunc-git'
         'vapoursynth-plugin-muvsfunc-git'
         'vapoursynth-plugin-nnedi3_resample-git'
         'vapoursynth-plugin-mvtools_sf-git'
         'vapoursynth-plugin-rgsf-git'
         'vapoursynth-plugin-vcmod'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/groucho86/G41Fun.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

package(){
  cd "${_plug}"
  install -Dm644 G41Fun.py "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}
