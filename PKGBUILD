# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=dither
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r19.0f209b6
pkgrel=3
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://forum.doom9.org/showthread.php?t=171525'
license=('GPL')
depends=('vapoursynth-plugin-fmtconv-git')
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
  cd "${_plug}"
  install -Dm644 Dither.py "${pkgdir}${_site_packages}/Dither.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/Dither.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/Dither.py"
}

