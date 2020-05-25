# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Michael Spencer <sonrisesoftware@gmail.com>

pkgname=liri-terminal
pkgver=0.2.0
pkgrel=2
pkgdesc="Terminal for Liri"
arch=("x86_64")
url="https://github.com/lirios/terminal"
license=("GPL")
depends=('fluid' 'qt5-gsettings')
makedepends=('liri-qbs-shared')
replaces=('papyros-terminal')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lirios/terminal/archive/v$pkgver.tar.gz")
sha256sums=('6a99b3ff0d8b33a3a60b58d98fd9a82d89e09578cb73fcdf5d014e8feb30eb8d')

build() {
  cd terminal-$pkgver
  qbs setup-toolchains --type gcc /usr/bin/g++ gcc
  qbs setup-qt /usr/bin/qmake-qt5 qt5
  qbs config profiles.qt5.baseProfile gcc
  qbs build --no-install -d build profile:qt5 modules.lirideployment.prefix:/usr \
                                              modules.lirideployment.qmlDir:/usr/lib/qt/qml
}

package() {
  cd terminal-$pkgver
  qbs install -d build --no-build -v --install-root "$pkgdir" profile:qt5
}
