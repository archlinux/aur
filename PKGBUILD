# Maintainer: SarangRao20 <sarangrao20@gmail.com>
# Contributor: SarangRao20

pkgname=battery-charge-limiter
pkgver=1.0.0
pkgrel=2
pkgdesc="Cross-platform battery charge limiter — enforces 80% hardware cap on laptops where BIOS hides this feature. Arch Linux daemon using acpi_call."
arch=('any')
url="https://github.com/SarangRao20/battery-charge-limiter"
license=('MIT')
depends=('python' 'acpi_call')
conflicts=()
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SarangRao20/battery-charge-limiter/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
install=battery-charge-limiter.install
sha256sums=('836821877e5b092a865802aa185eb85170514b81e67b16b457d975c989f763e1')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Daemon script
  install -Dm755 "arch/battery-charge-limiter" "${pkgdir}/usr/bin/battery-charge-limiter"

  # Systemd service
  install -Dm644 "arch/battery-charge-limiter.service" "${pkgdir}/usr/lib/systemd/system/battery-charge-limiter.service"

  # Config
  install -Dm644 "arch/battery-charge-limiter.conf" "${pkgdir}/etc/battery-charge-limiter.conf"

  # EC detection tool
  install -Dm755 "arch/detect-ec.sh" "${pkgdir}/usr/bin/battery-charge-limiter-detect-ec"

  # Kernel module auto-load config
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/arch/acpi_call.conf" "${pkgdir}/etc/modules-load.d/acpi_call.conf"
}
