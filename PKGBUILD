# Maintainer: Evert Vorster <superchief@evertvorster.com>

pkgname=dynamic-power-daemon
pkgver=4.0.0
pkgrel=1
pkgdesc="Auto-switches powerprofilesctl/asusctl profiles by CPU load & workload"
arch=('any')
url="https://github.com/evertvorster/dynamic-power-daemon"
license=('GPL3')
depends=(
  'python'
  'python-yaml'
  'python-dbus'
  'python-gobject'
  'python-psutil'
  'python-setproctitle'
  'python-systemd'
)

source=("https://github.com/evertvorster/dynamic-power-daemon/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')
install="${pkgname}.install"   # <- hook lives here

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/python"
  make DESTDIR="$pkgdir" PREFIX=/usr install

  # service
  install -Dm644 ../dynamic-power.service     "${pkgdir}/usr/lib/systemd/system/dynamic-power.service"
}
