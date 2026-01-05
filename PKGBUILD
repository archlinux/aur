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
sha256sums=('348f302ebb26bc75fb3353e01070afb69ec98e5d19a66fbef936156e1837d46f')

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
