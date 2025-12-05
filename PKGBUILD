# Maintainer: DIMFLIX <dimflix.official@gmail.com>
pkgname=bluevein
pkgver=0.1.1
pkgrel=1
pkgdesc="Bluetooth dual-boot key synchronization service"
arch=('x86_64')
url="https://github.com/meowrch/BlueVein"
license=('GPL-3.0')
depends=('dbus')
makedepends=('rust' 'cargo')
provides=('bluevein')
conflicts=('bluevein-git' 'bluevein-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('25ca0647665b1cc19839c3213a0303626d6e5094ce6836d56519bf276a8e1a9c')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  
  # Install binary
  install -Dm755 target/release/bluevein "$pkgdir/usr/bin/bluevein"
  
  # Install systemd service
  install -Dm644 systemd/bluevein.service "$pkgdir/usr/lib/systemd/system/bluevein.service"
  
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
