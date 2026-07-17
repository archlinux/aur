# Maintainer: Amish <contact at via dot aur>
pkgname=pacman-systemd-inhibit
pkgver=2.1
pkgrel=1
pkgdesc='Inhibit system shutdown, reboot etc. when pacman is upgrading the system'
arch=('x86_64')
url="https://github.com/amishmm/pacman-systemd-inhibit"
license=('GPL-3.0-or-later')
depends=('pacman' 'systemd')
backup=('etc/pacman.d/battery.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/amishmm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('744b2608d94a51ed60c264cd5a1b08dac4429245da43d117c5b5e26fa12b3bfb')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d -m 755 "${pkgdir}"/{etc,usr/bin}
  install -D -m 644 -t "${pkgdir}"/etc/pacman.d battery.conf
  install -D -m 644 -t "${pkgdir}"/usr/share/libalpm/hooks hooks/{00,zz}-50-systemd-inhibit.hook
  install -D -m 700 -t "${pkgdir}"/usr/share/libalpm/scripts scripts/systemd-inhibit-hook
  ln -s sleep "${pkgdir}"/usr/bin/pminhibit-sleep
}
