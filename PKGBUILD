# $Id: PKGBUILD 159441 2016-01-30 05:03:01Z fyan $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Riley Trautman <asonix.dev@gmail.com>
# Contributor: Michael Spencer <sonrisesoftware@gmail.com>

pkgname=liri-files
pkgver=0.2.0
pkgrel=2
pkgdesc="The file manager for Liri"
arch=("x86_64")
url="https://github.com/lirios/files"
license=("GPL")
depends=('fluid' 'taglib')
makedepends=('liri-qbs-shared' 'qt5-tools')
replaces=('papyros-files')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lirios/files/archive/v$pkgver.tar.gz")
sha256sums=('a3c03d078af5cdf53e621bb41f0c09ab33cc5dcd51d5d6317ba4f845a4399383')

build() {
  cd files-$pkgver
  qbs setup-toolchains --type gcc /usr/bin/g++ gcc
  qbs setup-qt /usr/bin/qmake-qt5 qt5
  qbs config profiles.qt5.baseProfile gcc
  qbs build --no-install -d build profile:qt5 modules.lirideployment.prefix:/usr \
                                              modules.lirideployment.qmlDir:/usr/lib/qt/qml
}

package() {
  cd files-$pkgver
  qbs install -d build --no-build -v --install-root "$pkgdir" profile:qt5
}
