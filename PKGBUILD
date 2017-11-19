# Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgbase=petrified
pkgname=('petrified' 'petrified-systemd')
pkgver=2.0.1
pkgrel=1
arch=('any')
url="https://github.com/troyengel/petrified"
license=('GPL3')
options=('emptydirs')
source=("https://github.com/troyengel/petrified/archive/v${pkgver}.tar.gz")
sha256sums=('ab83c4b5e2a84d8d8ab9adfe2d914045e8192b02d18d59c5305d2d45845b5e2a')

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
