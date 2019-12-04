# Maintainer: Amish <contact at via dot aur>
pkgname=pacman-systemd-inhibit
pkgver=1.0
pkgrel=1
pkgdesc='Inhibit system shutdown, reboot etc. when pacman is upgrading the system'
arch=('x86_64')
url="https://github.com/amishmm/pacman-systemd-inhibit"
license=('GPL')
depends=('pacman')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/amishmm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('74b8017d8e76efcd38b142d2efb0c25223f7950b932d3666e55a7574dad689e5')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d -m 755 "${pkgdir}"/usr/bin
  install -D -m 644 -t "${pkgdir}"/usr/share/libalpm/hooks hooks/{00,zz}-50-systemd-inhibit.hook
  install -D -m 700 -t "${pkgdir}"/usr/share/libalpm/scripts scripts/systemd-inhibit-hook
  ln -s sleep "${pkgdir}"/usr/bin/pacman-systemd-inhibit-sleep
}
