# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=photoflare-git
pkgver=1.6.2.r0.gb30cb87
pkgrel=1
pkgdesc="Quick, simple but powerful Cross Platform image editor."
arch=('x86_64')
url="http://photoflare.io/"
license=('GPL3')
depends=('desktop-file-utils' 'graphicsmagick' 'hicolor-icon-theme' 'qt5-base' 'qt5-imageformats')
makedepends=('git' 'qt5-tools')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
replaces=('photofiltrelx')
source=("${pkgname%-*}::git+https://github.com/PhotoFlare/photoflare.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "${pkgname%-*}"
  qmake-qt5 PREFIX=/usr Photoflare.pro \
    QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
    QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  cd "${pkgname%-*}"
  make INSTALL_ROOT="$pkgdir" install
  rm -r "$pkgdir/usr/share/pixmaps"
}
