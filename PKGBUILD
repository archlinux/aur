# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='convertall'
pkgname="${_pkgname}-git"
pkgver=0.8.0.r0.g95ab355
pkgrel=1
pkgdesc='Flexible unit converter'
arch=('any')
url='https://convertall.bellz.org'
_url_source='https://github.com/doug-101/ConvertAll'
license=('GPL3')
depends=('hicolor-icon-theme' 'python-pyqt5')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${_url_source}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_pkgname}"
  ./install.py \
    -b "${pkgdir}" \
    -i "/usr/share/pixmaps/${_pkgname}" \
    -p '/usr'
  rm -f "${pkgdir}/usr/share/doc/${_pkgname}/"{'INSTALL','LICENSE'}
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

# vim: ts=2 sw=2 et:
