# Maintainer: Ville Lautanala <lautis at gmail dot com>
pkgname=ruuvitag-listener
pkgver=0.5.5
pkgrel=1
pkgdesc='Listen to RuuviTag Bluetooth LE sensor measurements and output using InfluxDB line protocol.'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/lautis/ruuvitag-listener' 
license=('MIT')
install='ruuvitag-listener.install'
makedepends=(cargo)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lautis/ruuvitag-listener/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('8623a175fa026b31fa38b6f69074396d660a09f466279c1324d1a215df260f2a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked --target-dir target
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "${pkgdir}/usr/bin/${pkgname}"
}
