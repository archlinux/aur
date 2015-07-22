# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=cmst
pkgname=$_pkgname-git
pkgver=2015.03.01.69.g19feb80
pkgrel=1
pkgdesc="QT GUI for Connman with system tray icon"
arch=("i686" "x86_64")
url=https://github.com/andrew-bibb/cmst
license=("MIT")
depends=("qt5-base" "libxkbcommon-x11" "connman")
makedepends=("git")
provides=("cmst")
conflicts=("cmst")
source=("git+https://github.com/andrew-bibb/cmst.git")
sha256sums=("SKIP")

pkgver() {
    cd $_pkgname
    git describe --tags | sed 's/cmst.//;s/-/./g'
}

build() {
    cd $_pkgname
    qmake-qt5 DISTRO=arch
    make
}

package() {
    cd $_pkgname
    make INSTALL_ROOT=$pkgdir install
    install -D -m644 $srcdir/$_pkgname/text/license.txt \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
