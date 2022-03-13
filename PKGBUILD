# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=xaa
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=3.2.g6a39c63
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url="https://github.com/dubhater/vapoursynth-${_plug}"
license=('GPL')
depends=('vapoursynth-plugin-eedi2-git'
         'vapoursynth-plugin-znedi3-git'
         'vapoursynth-plugin-sangnom-git'
         'vapoursynth-plugin-tcanny-git'
         'vapoursynth-plugin-tedgemask-git'
         'vapoursynth-plugin-nnedi3cl-git'
         'vapoursynth-plugin-eedi3m-git'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dubhater/vapoursynth-${_plug}.git")
sha256sums=('SKIP')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

package(){
  cd "${_plug}"
  install -Dm644 "${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}
