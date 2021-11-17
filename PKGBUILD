# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=timetracking
pkgver=1.5.20
pkgrel=1
pkgdesc="Simple command line time tracking application"
arch=('x86_64')
url="https://github.com/hardliner66/timetracking/"
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('188088efacaf9c16eca06bbcefa8a3ff83dee7c98c42dda7e801ab70e111bebaffb8ce1633b4d3bebd0d094d6ed0df5fc0a18c0650af14ab5c4883743f09bf19')
b2sums=('e64075c8de68a4b2a3a3764e2cbf40cbb9331691a0f03a6ed285ab29acfdb3d0f9bcc1396b4ff4a2ea811ba26c22248e187a5020c515dfd9522fe07edb17c2c9')

prepare() {
  cd "$pkgname-$pkgver"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/tt

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
