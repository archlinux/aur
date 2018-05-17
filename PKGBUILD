# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Riley Trautman <asonix.dev@gmail.com>
# Contributor: Michael Spencer <sonrisesoftware@gmail.com>

pkgname=liri-text
pkgver=0.3.0
pkgrel=1
pkgdesc='Material Design text editor'
arch=('x86_64')
url='https://github.com/lirios/text'
license=('GPL')
depends=('fluid')
makedepends=('liri-qbs-shared' 'qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lirios/text/archive/v$pkgver.tar.gz")
sha256sums=('0c0a0482a5bc8fe9f5c69dd6b5c94d5987da7f6966acd65b13366167780206bb')

build() {
  cd text-$pkgver
  qbs setup-toolchains --type gcc /usr/bin/g++ gcc
  qbs setup-qt /usr/bin/qmake-qt5 qt5
  qbs config profiles.qt5.baseProfile gcc
  qbs build --no-install -d build profile:qt5 modules.lirideployment.prefix:/usr \
                                              modules.lirideployment.qmlDir:/usr/lib/qt/qml
}

package() {
  cd text-$pkgver
  qbs install -d build --no-build -v --install-root "$pkgdir" profile:qt5
}
