# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=simpleconvert-git
pkgver=3.2.r1.g4538dfb
pkgrel=1
pkgdesc='Application to convert multiple files to another filetype using FFMPEG.'
url='https://github.com/bartkessels/simpleconvert'
arch=('x86_64')
license=('GPL3')
depends=('ffmpeg' 'hicolor-icon-theme' 'qt5-base')
makedepends=('git' 'qt5-tools')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-*}"
  qmake-qt5 PREFIX=/usr SimpleConvert.pro \
    QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
    QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  make -C "${pkgname%-*}" INSTALL_ROOT="${pkgdir}" install
}
