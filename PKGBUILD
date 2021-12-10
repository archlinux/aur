# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=maskdetail
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r10.1f927c8
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://forum.doom9.org/showthread.php?t=171546'
license=('LGPL2.1')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/MonoS/VS-MaskDetail.git")
sha256sums=('SKIP')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "${_plug}"
  install -Dm644 MaskDetail.py "${pkgdir}${_site_packages}/MaskDetail.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/MaskDetail.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/MaskDetail.py"
}
