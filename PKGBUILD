# Maintainer: Evert Vorster <superchief@evertvorster.com>

pkgname=dynamic-power-daemon
pkgver=4.6.0
pkgrel=1
pkgdesc="Auto-switches powerprofilesctl/asusctl profiles by CPU load & workload; with DBus control, per-user helpers and Qt tray UI"
arch=('any')
url="https://github.com/evertvorster/dynamic-power-daemon"
license=('GPL3')
depends=(
  'python'
  'python-dbus'
  'python-psutil'
  'python-pyqt6'
  'python-pyqtgraph'
  'python-pyyaml'
  'python-inotify-simple'
  'python-setproctitle'
  'python-dbus-next'
  'python-systemd'
  'kscreen'
  'qt6-base'
  'qt6-tools'
  'power-profiles-daemon'
  'kscreen'
  'cmake'
  'pkgconf'
  'qt6-base'
  'yaml-cpp'
  'systemd'
)
optdepends=(
  'asusctl: panel overdrive toggle on Asus laptops'
)
source=("https://github.com/evertvorster/dynamic-power-daemon/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd $srcdir/$pkgname-$pkgver/src
  rm -rf build
  cmake -S . -B build
  cmake --build build
}

install="${pkgname}.install"

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # The root Makefile handles installation of all components
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
