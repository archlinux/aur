# Maintainer: Pavel Olizko <olizkopavel@proton.me>
pkgname=mf-cli
pkgver=0.1.4
pkgrel=1
pkgdesc="CLI tool for Arturia MiniFuse 1"
arch=('x86_64')
url="https://github.com/nolight132/mf-cli"
license=('MIT')
depends=('glibc' 'gcc-libs' 'libusb' 'systemd-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e6c21bb99f56a817ed3686def8d6e2a0bdfcfe91ffe6ac8f1603d0b8d05c7c19')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/mf-cli" "$pkgdir/usr/bin/mf-cli"
  install -Dm644 "99-minifuse.rules" "$pkgdir/usr/lib/udev/rules.d/99-minifuse.rules"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
