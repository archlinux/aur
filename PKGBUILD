# Maintainer: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=tempsense-git
pkgver=LATEST
pkgrel=1
pkgdesc="command line client for the Diamex AVR Temp Sensor (DS18B20)"
arch=(i686 x86_64 armv6h)
url="https://git.tamcore.eu/philipp/tempsense"
depends=('hidapi' 'libusb-compat')
makedepends=('git')
provides=('tempsense')
license=('custom')
source=(git+https://git.tamcore.eu/philipp/tempsense.git)
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname%-git}"
  git submodule init
  git submodule update
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d -m0755 $pkgdir/usr/bin/
  install -D -m4755 tempsense $pkgdir/usr/bin/tempsense
  install -d -m0755 "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -D -m0644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
