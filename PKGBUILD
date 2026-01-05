# Maintainer: Pavel Olizko <olizkopavel@proton.me>
pkgname=mf-cli
pkgver=0.1.1
pkgrel=1
pkgdesc="CLI tool for Arturia MiniFuse 1"
arch=('x86_64')
url="https://github.com/nolight132/mf-cli"
license=('MIT')
depends=('glibc' 'gcc-libs' 'libusb' 'systemd-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dbffa7f4c122df0bab3e4dc2c695c8d206c81cfb423d8f60fbf0c96882f2f009')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/mf-cli" "$pkgdir/usr/bin/mf-cli"
  install -Dm644 "70-minifuse.rules" "$pkgdir/usr/lib/udev/rules.d/70-minifuse.rules"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
