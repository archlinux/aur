# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=photoflare-git
pkgver=1.5.4.r0.g8fc1e99
pkgrel=1
pkgdesc="Quick, simple but powerful Cross Platform image editor."
arch=('x86_64')
url="http://photoflare.io/"
license=('GPL3')
depends=('desktop-file-utils' 'graphicsmagick' 'hicolor-icon-theme' 'qt5-base')
makedepends=('git' 'qt5-tools')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
replaces=('photofiltrelx')
source=("git+https://github.com/PhotoFlare/photoflare.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-*}"
  qmake-qt5 PREFIX=/usr PhotoFlare.pro \
    QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
    QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  make -C "${pkgname%-*}" INSTALL_ROOT="$pkgdir/" install
}
