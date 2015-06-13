# Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgbase=petrified
pkgname=('petrified' 'petrified-systemd')
pkgver=1.0.5
pkgrel=1
changelog=petrified.archlog
arch=('any')
url="https://github.com/troyengel/petrified"
license=('GPL3')
options=('emptydirs')
source=("https://github.com/troyengel/petrified/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

package_petrified() {
  pkgdesc="Bash client to update dynamic DNS at freedns.afraid.org"
  depends=('util-linux' 'coreutils' 'bash' 'iproute2' 'curl')
  backup=('etc/petrified.conf')
  install=petrified.archinst

  cd "${srcdir}/${pkgbase}-${pkgver}"

  # Install the system bits
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}

package_petrified-systemd() {
  pkgdesc="Unit files for petrified systemd usage"
  depends=('petrified' 'systemd')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  # Systemd files
  make DESTDIR="${pkgdir}" PREFIX=/usr install-systemd
}
