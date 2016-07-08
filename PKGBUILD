# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=finedehalo
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r1
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='http://forum.doom9.org/showthread.php?t=173672'
license=('GPL')
depends=('vapoursynth-plugin-mvsfunc-git'
         'vapoursynth-plugin-havsfunc'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}"
           'vapoursynth-plugin-resamplehq-git')
source=("${_plug}::git+https://gist.github.com/bcd427ec0fa8fdf7c45433917521bac4.git")
sha1sums=('SKIP')

_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  printf "r%s" "$(git rev-list --count HEAD)"
}

package() {
  install -Dm644 "${_plug}/${_plug}.py" "${pkgdir}${_sites_packages}/${_plug}.py"
}
