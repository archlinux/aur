# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-gsettings
pkgver=1.2.0
pkgrel=1
pkgdesc="Qt-style wrapper for GSettings"
arch=('x86_64')
url="https://github.com/lirios/qtgsettings"
license=('LGPL3')
depends=('qt5-declarative' 'glib2')
makedepends=('liri-qbs-shared')
groups=('liri')
source=("https://github.com/lirios/qtgsettings/releases/download/v${pkgver}/qtgsettings-${pkgver}.tar.xz")
sha256sums=('0e66b2f2066e8e553abb3de069a3f76bf50382ed49b0790091341a8f3c5e15cb')

build() {
  cd qtgsettings-$pkgver
  qbs setup-toolchains --type gcc /usr/bin/g++ gcc
  qbs setup-qt /usr/bin/qmake-qt5 qt5
  qbs config profiles.qt5.baseProfile gcc
  qbs build --no-install -d build profile:qt5 modules.lirideployment.prefix:/usr \
                                              modules.lirideployment.qmlDir:/usr/lib/qt/qml
}

package() {
  cd qtgsettings-$pkgver
  qbs install -d build --no-build -v --install-root "$pkgdir" profile:qt5
}
