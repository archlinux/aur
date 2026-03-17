# Maintainer: Pavel Olizko <contact@nolight.dev>
pkgname=mf-cli
pkgver=0.1.5
pkgrel=1
pkgdesc="CLI tool for Arturia MiniFuse 1/2"
arch=('x86_64')
url="https://github.com/nolight132/mf-cli"
license=('MIT')
depends=('glibc' 'gcc-libs' 'libusb' 'systemd-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ff0326f03bb21463e5c87f3d8dde6a7211cd32326f82cbfb40d73587bab0e4be')

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
