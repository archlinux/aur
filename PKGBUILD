# Maintainer: DIMFLIX <dimflix.official@gmail.com>
pkgname=bluevein
pkgver=1.1.0
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
sha256sums=('ab1eef9551cfed2d49942e885ca69678e131e5976c8c0b2f7dd911c082bc58ec')

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
