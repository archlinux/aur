# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=kondo
pkgver=0.5
pkgrel=1
pkgdesc="Save disk space by cleaning non-essential files from software projects"
arch=('x86_64')
url="https://github.com/tbillington/kondo"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('050cfbaea70b5c17e415864c88cd4245b9b28ebcb4a92be6c5ae2d14cb9dd7ce22eacf6013d331ba1ae51bcd6a8b7114d73df800a6d83449176ad3604c42222b')
b2sums=('5df9a133b3aa024e0cdad5f85f598b05d0d23399c41f9a6ab3ab7930f98acf1e5c7be95e296cfaf512763362c366147154f53a8bfb235e911e94c01687b15b25')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/kondo

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
