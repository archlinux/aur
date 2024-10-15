# Maintainer: Nathan Price <gravityfargo@gmail.com>
# Contributor: codebling
pkgname=intel-thermalmonitor-git
pkgver=2.5.8.r7.g5e56d91
pkgrel=1
pkgdesc="Intel's tool to display thermald readings on a graph"
arch=('any')
url="https://github.com/intel/thermal_daemon/tree/master/tools/thermal_monitor"
license=('GPL-3.0-only')
depends=("thermald")
makedepends=('git' 'qt5-base' "qcustomplot")
source=('git+https://github.com/intel/thermal_daemon.git')
sha256sums=('SKIP')

prepare() {
  cd thermal_daemon/tools/thermal_monitor
  sed -i 's/LIBS += -lQCustomPlot/LIBS += -lqcustomplot/' ThermalMonitor.pro
}

pkgver() {
  cd "thermal_daemon"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd thermal_daemon/tools/thermal_monitor
  qmake ThermalMonitor.pro
  make
}

package() {
  cd thermal_daemon/tools/thermal_monitor
  install -Dm755 ThermalMonitor $pkgdir/usr/bin/ThermalMonitor
}
