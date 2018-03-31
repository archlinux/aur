# Maintainer: Stas Rudakou <stas at garage22 dot net>

pkgname=cobalt
_cratename=cobalt-bin
pkgver=0.12.1
pkgrel=1
pkgdesc="Static site generator written in Rust"
url="https://github.com/cobalt-org/cobalt.rs"
makedepends=('cargo')
depends=('openssl')
arch=('i686' 'x86_64')
license=('MIT')
source=("$_cratename-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_cratename/$pkgver/download")
sha256sums=('28cc9f0b8afcef0acba9584d9ee1753308ef63541c011f85a834cfbc07e3651c')

build() {
  cd "$_cratename-$pkgver"
  cargo build --release --features "syntax-highlight sass"
}

package() {
  cd "$_cratename-$pkgver"
  install -Dm755 target/release/cobalt "$pkgdir/usr/bin/cobalt"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
