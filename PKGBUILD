pkgname=intel-thermalmonitor-git
pkgver=r1.b4f58cc
pkgrel=1
pkgdesc="Intel's ThermalMonitor QT5 tool for monitoring and "
arch=('any')
url="https://github.com/intel/thermal_daemon/tree/master/tools/thermal_monitor"
license=('GPL3')
makedepends=('git' 'qt5-base')
source=("$pkgname::git+https://github.com/intel/thermal_daemon.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/thermal_daemon/tools/thermal_monitor"
  qmake-qt5 ThermalMonitor.pro
  make
}

package() {
  cd "$srcdir/thermal_daemon/tools/thermal_monitor"
  make DESTDIR="$pkgdir/" install
}
