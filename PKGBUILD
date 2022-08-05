# Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgbase=petrified
pkgname=('petrified' 'petrified-systemd')
pkgver=2.0.3
pkgrel=2
arch=('any')
url="https://git.dwarvenruins.com/tengel/petrified"
license=('GPL3')
options=('emptydirs')
source=("https://git.dwarvenruins.com/tengel/petrified/archive/v${pkgver}.tar.gz")
sha256sums=('b65780fa31bc2ff83ebfe904edc59d17c83759b3619fbd5d6ecd7e4b5c3eb96e')

package_petrified() {
  pkgdesc="Bash client to update dynamic DNS at freedns.afraid.org"
  depends=('util-linux' 'coreutils' 'bash' 'iproute2' 'curl')
  backup=('etc/petrified.conf')
  install=petrified.archinst

  cd "${srcdir}/${pkgbase}"

  # Install the system bits
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}

package_petrified-systemd() {
  pkgdesc="Unit files for petrified systemd usage"
  depends=('petrified' 'systemd')

  cd "${srcdir}/${pkgbase}"

  # Systemd files
  make DESTDIR="${pkgdir}" PREFIX=/usr install-systemd
}
