# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='anymeal'
pkgname="${_pkgname}-git"
pkgver=1.8.r1.g1535c12
pkgrel=1
pkgdesc='Recipe Management Software'
arch=('x86_64')
url='https://wedesoft.github.io/anymeal/'
_url_source='https://github.com/wedesoft/anymeal'
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-base' 'recode')
makedepends=('git' 'gtest' 'qt5-tools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${_url_source}.git")
sha256sums=('SKIP')

prepare() {
  # Fix Googletest file path
  sed -i.bak "24s|googletest/googletest|googletest|" "${_pkgname}/configure.ac"
}

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  autoreconf --install
  ./configure --prefix=/usr
}

package() {
  make DESTDIR="${pkgdir}" -C "${_pkgname}" install
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
