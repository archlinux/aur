# Maintainer: RedTide <redtid3@gmail.com>

pkgname=pamac-qt-aur
pkgver=0.2.0.r7.g56427be
pkgrel=1
pkgdesc="Pamac-QT is a GUI for libalpm (pacman) with AUR and Appstream support"
url="https://gitlab.manjaro.org/applications/pamac-qt"
arch=('x86_64')
license=('GPL3')
makedepends=('git')
depends=('qt5-base')
provides=('pamac-qt')
conflicts=('pamac-qt')
source=(
    "$pkgname"::"git+https://gitlab.manjaro.org/applications/pamac-qt.git"
    "pamac-qt.pro"
)
md5sums=(
    'SKIP'
    'a40b172e859a9d92d1c7e322ca711df3'
)
pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
    cd "$srcdir/$pkgname"
    qmake PREFIX="/usr/" ./../../pamac-qt.pro
    make INSTALL_DIR=$pkgdir
}
package() {
    cd "$srcdir/${pkgname}"
    make INSTALL_ROOT=$pkgdir install
}
