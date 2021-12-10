# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=ediresample
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r19.0f209b6
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://forum.doom9.org/showthread.php?t=171741'
license=('GPL')
depends=('vapoursynth-plugin-nnedi3-git'
         'vapoursynth-plugin-dither-git'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/IFeelBloated/VaporSynth-Functions.git")
sha256sums=('SKIP')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  install -Dm644 "${_plug}/EDIResample.py" "${pkgdir}${_site_packages}/EDIResample.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/EDIResample.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/EDIResample.py"
}

