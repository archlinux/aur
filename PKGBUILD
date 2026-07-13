# Maintainer: DIMFLIX <dimflix.official@gmail.com>
pkgname=bluevein
pkgver=1.2.0
pkgrel=1
pkgdesc="Bluetooth dual-boot key synchronization service"
arch=('x86_64')
url="https://github.com/meowrch/BlueVein"
license=('GPL-3.0')
depends=('dbus')
makedepends=('rust' 'cargo')
provides=('bluevein')
conflicts=('bluevein-git' 'bluevein-bin')
install=bluevein.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8fa05ca6a6e648bb5c521312c87f60ff34894fb0e8d2ddd264a29644f3dc3471')

build() {
  cd "BlueVein-$pkgver"
  cargo build --release --locked
}

package() {
  cd "BlueVein-$pkgver"
  
  # Install binary
  install -Dm755 target/release/bluevein "$pkgdir/usr/bin/bluevein"
  
  # Install systemd service
  install -Dm644 systemd/bluevein.service "$pkgdir/usr/lib/systemd/system/bluevein.service"
  
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
