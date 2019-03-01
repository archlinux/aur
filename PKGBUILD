# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=maskdetail
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r10.1f927c8
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=171546'
license=('LGPL2.1')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/MonoS/VS-MaskDetail.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  install -Dm644 "${_plug}/MaskDetail.py" "${pkgdir}${_site_packages}/MaskDetail.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/MaskDetail.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/MaskDetail.py"
}
