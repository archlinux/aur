# Maintainer: Ville Lautanala <lautis at gmail dot com>
pkgname=ruuvitag-listener
pkgver=0.8.0
pkgrel=1
pkgdesc='Listen to RuuviTag Bluetooth LE sensor measurements and output using InfluxDB line protocol.'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/lautis/ruuvitag-listener' 
license=('MIT')
install='ruuvitag-listener.install'
makedepends=(cargo)
depends=(bluez dbus)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lautis/ruuvitag-listener/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('42f06c169fdc70e295b0a2194390027be19a70c4218acccd5f70a9da8ad367c5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked --target-dir target
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "${pkgdir}/usr/bin/${pkgname}"
}
