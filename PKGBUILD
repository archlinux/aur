# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=tonemaping
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r9.c0c3705
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/age1988/vapoursynth-tonemapping'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/age1988/vapoursynth-tonemapping.git")
sha256sums=('SKIP')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${_plug}"
  install -Dm644 age_tm.py "${pkgdir}${_site_packages}/age_tm.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/age_tm.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/age_tm.py"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
