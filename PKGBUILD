# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=lostfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.0.g0a68168
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url="https://github.com/theChaosCoder/lostfunc"
license=('GPL')
depends=('vapoursynth-plugin-adjust-git'
         'vapoursynth-plugin-havsfunc'
         'vapoursynth-plugin-oyster-git'
         'vapoursynth-plugin-mvtools'
         'vapoursynth-plugin-knlmeanscl-git'
         'vapoursynth-plugin-awarpsharp2-git'
         'vapoursynth-plugin-bm3d-git'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/theChaosCoder/lostfunc.git")
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
