# Maintainer: SarangRao20 <raosarang2006@gmail.com>
# Contributor: SarangRao20

pkgname=battery-charge-limiter
pkgver=1.1.0
pkgrel=1
pkgdesc="Cross-platform battery charge limiter — enforces 80% hardware cap on laptops where BIOS hides this feature. Arch Linux daemon using acpi_call."
arch=('any')
url="https://github.com/SarangRao20/battery-charge-limiter"
license=('MIT')
depends=('python' 'acpi_call')
conflicts=()
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SarangRao20/battery-charge-limiter/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
install=battery-charge-limiter.install
sha256sums=('fed8fb735d0ebf2bc347258624dcf5b09d931445b5ada7bd35df3fb05903de7f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Daemon script
  install -Dm755 "arch/battery-charge-limiter" "${pkgdir}/usr/bin/battery-charge-limiter"

  # Helper commands
  install -Dm755 "arch/bat-status" "${pkgdir}/usr/bin/bat-status"
  install -Dm755 "arch/bat-inhibit" "${pkgdir}/usr/bin/bat-inhibit"
  install -Dm755 "arch/bat-auto" "${pkgdir}/usr/bin/bat-auto"

  # Systemd service
  install -Dm644 "arch/battery-charge-limiter.service" "${pkgdir}/usr/lib/systemd/system/battery-charge-limiter.service"

  # Config
  install -Dm644 "arch/battery-charge-limiter.conf" "${pkgdir}/etc/battery-charge-limiter.conf"

  # EC detection tool
  install -Dm755 "arch/detect-ec.sh" "${pkgdir}/usr/bin/battery-charge-limiter-detect-ec"

  # Kernel module auto-load config
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/arch/acpi_call.conf" "${pkgdir}/etc/modules-load.d/acpi_call.conf"
}
