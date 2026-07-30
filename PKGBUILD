# Maintainer: SarangRao20 <sarangrao20@gmail.com>
# Contributor: SarangRao20

pkgname=battery-charge-limiter
pkgver=1.0.0
pkgrel=1
pkgdesc="Cross-platform battery charge limiter — enforces 80% hardware cap on laptops where BIOS hides this feature. Arch Linux daemon using acpi_call."
arch=('any')
url="https://github.com/SarangRao20/battery-charge-limiter"
license=('MIT')
depends=('python' 'acpi_call')
makedepends=('git')
conflicts=()
provides=("${pkgname}")
source=("${pkgname}-master.tar.gz::https://github.com/SarangRao20/battery-charge-limiter/archive/master.tar.gz")
install=battery-charge-limiter.install
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}-master"

  # Daemon script
  install -Dm755 "arch/battery-charge-limiter" "${pkgdir}/usr/bin/battery-charge-limiter"

  # Systemd service
  install -Dm644 "arch/battery-charge-limiter.service" "${pkgdir}/usr/lib/systemd/system/battery-charge-limiter.service"

  # Config
  install -Dm644 "arch/battery-charge-limiter.conf" "${pkgdir}/etc/battery-charge-limiter.conf"

  # EC detection tool
  install -Dm755 "arch/detect-ec.sh" "${pkgdir}/usr/bin/battery-charge-limiter-detect-ec"

  # Kernel module auto-load config
  echo "acpi_call" > "${pkgdir}/etc/modules-load.d/acpi_call.conf"
}
