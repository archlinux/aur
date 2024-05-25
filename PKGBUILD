# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=adjust
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.1.ga3af7cb
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='http://forum.doom9.org/showthread.php?t=171956'
license=('custom:WTFPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=(
  "${_plug}::git+https://github.com/dubhater/vapoursynth-${_plug}.git"
  'COPYING' # http://www.wtfpl.net/txt/copying
)
sha256sums=(
  'SKIP'
  '7637386b5f81e8a719ca336233149005e5fa28b5e6054ea7b67de49355b0ad40'
)

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

  install -Dm644 readme.rst "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.rst"
  install -Dm644 "${srcdir}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
