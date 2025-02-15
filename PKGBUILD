# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=ocsuite
pkgname=vapoursynth-tools-${_plug}-git
pkgver=r6.c20a166
pkgrel=1
pkgdesc="Tools for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/OrangeChannel/ocsuite'
license=('custom:UNLICENSE')
depends=('vapoursynth-tools-acsuite-git')
makedepends=('git')
provides=("vapoursynth-tools-${_plug}")
conflicts=("vapoursynth-tools-${_plug}")
source=("${_plug}::git+https://github.com/OrangeChannel/ocsuite.git")
sha256sums=('SKIP')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
#   echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "${_plug}"
  install -Dm644 ocsuite.py "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/tools/${_plug}/README.md"
  install -Dm644 UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
  install -Dm644 tests.py "${pkgdir}/usr/share/doc/vapoursynth/tools/${_plug}/tests.py"
}
