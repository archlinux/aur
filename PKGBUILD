pkgname=intel-thermalmonitor-git
pkgver=v1.4.2.r515.g950d6b0
pkgrel=1
pkgdesc="Intel's ThermalMonitor QT5 tool for monitoring thermald"
arch=('any')
url="https://github.com/intel/thermal_daemon/tree/master/tools/thermal_monitor"
license=('GPL3')
makedepends=('git' 'qt5-base')
source=("$pkgname::git+https://github.com/intel/thermal_daemon.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname/tools/thermal_monitor"
  qmake-qt5 ThermalMonitor.pro
  make
}

package() {
  cd "$srcdir/$pkgname/tools/thermal_monitor"
  install -Dm755 ThermalMonitor $pkgdir/usr/bin/ThermalMonitor
}
