# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=liri-calculator
pkgver=1.1.1
pkgrel=1
pkgdesc="More than a simple cross-platform Material Design calculator"
arch=("x86_64")
url="https://github.com/lirios/calculator"
license=("GPL")
depends=('fluid')
makedepends=('liri-qbs-shared')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lirios/calculator/archive/v$pkgver.tar.gz")
sha512sums=('26f45a1aebb2f83e8e1db17b0cdb8fad4d470b3db4cbcd20406cdd541c2e15b6556d95a0de9a63607180398ac59a9d0b4a85a8c9ca25f468dc109580f19e87be')

build() {
  cd calculator-$pkgver
  qbs setup-toolchains --type gcc /usr/bin/g++ gcc
  qbs setup-qt /usr/bin/qmake-qt5 qt5
  qbs config procalculator.qt5.baseProfile gcc
  qbs build --no-install -d build profile:qt5 modules.lirideployment.prefix:/usr \
                                              modules.lirideployment.qmlDir:/usr/lib/qt/qml
}

package() {
  cd calculator-$pkgver
  qbs install -d build --no-build -v --install-root "$pkgdir" profile:qt5
}
