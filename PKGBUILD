# Maintainer: Ville Lautanala <lautis at gmail dot com>
pkgname=ruuvitag-listener
pkgver=0.6.1
pkgrel=1
pkgdesc='Listen to RuuviTag Bluetooth LE sensor measurements and output using InfluxDB line protocol.'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/lautis/ruuvitag-listener' 
license=('MIT')
install='ruuvitag-listener.install'
makedepends=(cargo)
depends=(bluez dbus)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lautis/ruuvitag-listener/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('c11733e43a696edfe3ca416349e3398d96f70e76316007d48eae0f1e46c6fe79')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked --target-dir target
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "${pkgdir}/usr/bin/${pkgname}"
}
