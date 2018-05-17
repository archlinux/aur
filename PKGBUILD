# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=liri-calculator
pkgver=1.1.0
pkgrel=1
pkgdesc="More than a simple cross-platform Material Design calculator"
arch=("x86_64")
url="https://github.com/lirios/calculator"
license=("GPL")
depends=('fluid')
makedepends=('liri-qbs-shared')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lirios/calculator/archive/v$pkgver.tar.gz")
sha256sums=('0773f02e2cc6e05fae04c56a05e735d0b45536a4c6d2f99cb7fc8ba83a0dead2')

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
