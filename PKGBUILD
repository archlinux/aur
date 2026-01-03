# Maintainer: Ville Lautanala <lautis at gmail dot com>
pkgname=ruuvitag-listener
pkgver=0.7.0
pkgrel=1
pkgdesc='Listen to RuuviTag Bluetooth LE sensor measurements and output using InfluxDB line protocol.'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/lautis/ruuvitag-listener' 
license=('MIT')
install='ruuvitag-listener.install'
makedepends=(cargo)
depends=(bluez dbus)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lautis/ruuvitag-listener/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('74a527646b76a5c97d32637b1d2867dcd848cc70302a8a5e5657c1c46804fb6c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked --target-dir target
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "${pkgdir}/usr/bin/${pkgname}"
}
