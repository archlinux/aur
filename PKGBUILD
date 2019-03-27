# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=xaa
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v2.0.ga7766a0
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url="https://github.com/dubhater/vapoursynth-${_plug}"
license=('GPL')
depends=('vapoursynth'
         'vapoursynth-plugin-eedi2-git'
         'vapoursynth-plugin-eedi3cl-git'
         'vapoursynth-plugin-nnedi3cl-git'
         'vapoursynth-plugin-sangnom'
         'vapoursynth-plugin-tcanny-git'
         'vapoursynth-plugin-tedgemask-git'
         'vapoursynth-plugin-znedi3-git'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dubhater/vapoursynth-${_plug}.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

package(){
  cd "${_plug}"
  install -Dm644 "${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}