# Maintainer: Pavel Olizko <olizkopavel@proton.me>
pkgname=mf-cli
pkgver=0.1.2
pkgrel=1
pkgdesc="CLI tool for Arturia MiniFuse 1"
arch=('x86_64')
url="https://github.com/nolight132/mf-cli"
license=('MIT')
depends=('glibc' 'gcc-libs' 'libusb' 'systemd-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('de97f996da46a712ed8076164b867fcd502ab9710c83d943fb8845a8e17d178a')

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
