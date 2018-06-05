# Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgbase=petrified
pkgname=('petrified' 'petrified-systemd')
pkgver=2.0.2
pkgrel=1
arch=('any')
url="https://gitlab.com/troyengel/petrified"
license=('GPL3')
options=('emptydirs')
source=("https://gitlab.com/troyengel/petrified/-/archive/v${pkgver}/petrified-v${pkgver}.tar.gz")
sha256sums=('b60d1e0b45f3da33b3f89f0eff9711bfe4be28abd5529c0ee2140293e33fc08c')

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
