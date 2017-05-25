# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=quiterss-git
pkgver=0.18.4.r4.g0d295bc2
pkgrel=1
pkgdesc="Fast and light RSS/Atom feed reader written in Qt/С++"
arch=('i686' 'x86_64')
url="https://quiterss.org"
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-multimedia' 'qt5-webkit')
makedepends=('git' 'qt5-tools')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('git+https://github.com/QuiteRSS/quiterss.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-*}"
  qmake-qt5 \
    QuiteRSS.pro \
    PREFIX=/usr \
    CONFIG+=LINUX_INTEGRATED \
    CONFIG+=debug \
    DISABLE_PHONON=1 \
    INSTALL_ROOT_PATH="$pkgdir/"
  make
}

package() {
  make -C "${pkgname%-*}" INSTALL_ROOT="$pkgdir/" install
}
