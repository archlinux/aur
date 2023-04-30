# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=cmst
pkgname=$_pkgname-git
pkgver=2023.03.14
pkgrel=1
pkgdesc='QT GUI for Connman with system tray icon'
arch=('i686' 'x86_64')
url=https://github.com/andrew-bibb/cmst
license=('MIT')
depends=('qt5-base' 'connman' 'gtk-update-icon-cache')
makedepends=('git' 'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
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
