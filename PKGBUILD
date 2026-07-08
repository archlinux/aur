# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=plasma6-applets-thermal-monitor
pkgver=0.2.7
pkgrel=2
pkgdesc="A KDE Plasmoid for displaying system temperatures."
arch=('any')
url='https://invent.kde.org/olib/thermalmonitor'
license=("MIT")
depends=('plasma-workspace' 'ksystemstats' 'libksysguard' 'kitemmodels' 'kdeclarative' 'kquickcharts')
makedepends=('cmake' 'extra-cmake-modules')
source=("$url/-/archive/v$pkgver/thermalmonitor-v$pkgver.tar.gz")
sha256sums=('6442c696c204a0b218c847acf19951a9970528dd575904df736a559d566463d4')

prepare() {
  cd thermalmonitor-v$pkgver
  # Fix this issue: https://invent.kde.org/olib/thermalmonitor/-/work_items/33
  sed -i 's/display\.includes("\[")/display.startsWith("[")/' package/contents/ui/config/AvailableSensors.qml # Special thanks to  @danieljsv
}

build() {
  cd thermalmonitor-v$pkgver
  cmake -S . -B build
  cmake --build build
}

package() {
  cd thermalmonitor-v$pkgver
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 -t $pkgdir/usr/share/licenses/$pkgname LICENSE.txt
}
