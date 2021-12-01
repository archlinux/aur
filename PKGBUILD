# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname=pdfquirk-git
pkgver=continuous.r18.g3f45dc9
pkgrel=1
pkgdesc="Creating PDFs from images or scanner made easy"
arch=('x86_64')
url="https://dragotin.github.io/quirksite"
license=(GPL3)
depends=(hicolor-icon-theme imagemagick qt6-tools)
makedepends=(clang extra-cmake-modules glu git)
optdepends=('sane: scanning support')
provides=("${pkgname/-git/}")
source=("git+https://github.com/dragotin/${pkgname/-git/}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname/-git/}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake \
    -S "${pkgname/-git/}" \
    -B build \
    -DUSE_QT6=yes \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm644 "${pkgname/-git/}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}