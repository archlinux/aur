# Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgbase=petrified
pkgname=('petrified' 'petrified-systemd')
pkgver=2.0.3
pkgrel=1
arch=('any')
url="https://gitlab.com/troyengel/petrified"
license=('GPL3')
options=('emptydirs')
source=("https://gitlab.com/troyengel/petrified/-/archive/v${pkgver}/petrified-v${pkgver}.tar.gz")
sha256sums=('bb01029abc7796d2dd824f88beb2da05fb8da10ceb3ec7a0c1682631d670fc27')

package_petrified() {
  pkgdesc="Bash client to update dynamic DNS at freedns.afraid.org"
  depends=('util-linux' 'coreutils' 'bash' 'iproute2' 'curl')
  backup=('etc/petrified.conf')
  install=petrified.archinst

  cd "${srcdir}/${pkgbase}-v${pkgver}"

  # Install the system bits
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}

package_petrified-systemd() {
  pkgdesc="Unit files for petrified systemd usage"
  depends=('petrified' 'systemd')

  cd "${srcdir}/${pkgbase}-v${pkgver}"

  # Systemd files
  make DESTDIR="${pkgdir}" PREFIX=/usr install-systemd
}
