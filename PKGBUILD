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
conflicts=()
provides=("${pkgname}")
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/SarangRao20/battery-charge-limiter/archive/v${pkgver}.tar.gz")
install=battery-charge-limiter.install
sha256sums=('07d17497f8f2575e75982e50d7641a9cae001767a10056e913a0f7711d7243e4')

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
  echo "acpi_call" > "${pkgdir}/etc/modules-load.d/acpi_call.conf"
}
