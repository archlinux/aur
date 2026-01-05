# Maintainer: Pavel Olizko <olizkopavel@proton.me>
pkgname=mf-cli
pkgver=0.1.3
pkgrel=1
pkgdesc="CLI tool for Arturia MiniFuse 1"
arch=('x86_64')
url="https://github.com/nolight132/mf-cli"
license=('MIT')
depends=('glibc' 'gcc-libs' 'libusb' 'systemd-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fd9bb5b476e3b687bced1b1cb9a0d345823a296322eed66baf815a572e518a19')

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
