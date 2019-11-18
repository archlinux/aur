# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=quiterss-git
pkgver=0.19.1.r0.gc873b11a
pkgrel=1
pkgdesc="Fast and light RSS/Atom feed reader written in Qt/С++"
arch=('x86_64')
url="https://quiterss.org"
license=('GPL3')
depends=('gst-plugins-good' 'qt5-multimedia' 'qt5-webkit')
makedepends=('git' 'qt5-tools')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('quiterss::git+https://github.com/QuiteRSS/quiterss.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-*}"
  qmake-qt5 CONFIG+=release PREFIX=/usr \
    QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
    QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  make -C "${pkgname%-*}" INSTALL_ROOT="$pkgdir/" install
}
