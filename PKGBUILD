# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=scoll
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r2
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://gist.github.com/4re'
license=('GPL')
depends=('vapoursynth'
         'vapoursynth-plugin-vshelpers-git'
         'vapoursynth-plugin-nnedi3-git'
         'vapoursynth-plugin-sangnom-hg'
         'vapoursynth-plugin-msmoosh-git'
         'vapoursynth-plugin-genericfilters-git'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}"
           )
source=("${_plug}::git+https://gist.github.com/3acdb8d90abf78643d4e.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  printf "r%s" "$(git rev-list --count HEAD)"
}

package() {
  install -Dm644 "${_plug}/${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}
