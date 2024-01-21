# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-qt-dbus-factory-git
pkgver=6.0.0.r5.gc516e3e
pkgrel=1
pkgdesc='A repository stores auto-generated Qt5 dbus code (libdframeworkdbus)'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-qt-dbus-factory"
license=('GPL3')
depends=('qt5-base' 'dtkcore')
makedepends=('git' 'python')
conflicts=('deepin-qt-dbus-factory')
provides=('deepin-qt-dbus-factory')
groups=('deepin-git')
source=("$pkgname::git+https://github.com/linuxdeepin/dde-qt-dbus-factory.git")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  qmake-qt5 PREFIX=/usr
  make -j$(nproc)
}

package() {
  cd $pkgname
  make INSTALL_ROOT="$pkgdir" install
}
