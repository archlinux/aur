# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=pdfquirk
pkgname=${_pkgname}-git
pkgver=continuous.r0.g0d79759
pkgrel=1
pkgdesc="Create PDFs from images or scanner"
arch=('x86_64')
url="https://dragotin.github.io/quirksite/"
license=('GPL3')
source=("git+https://github.com/dragotin/${_pkgname}.git")
depends=('git' 'imagemagick')
optdepends=('sane: scanning support')
makedepends=('extra-cmake-modules' 'glu' 'qt5-base')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "${_pkgname}"
  make DESTDIR=${pkgdir} install
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}