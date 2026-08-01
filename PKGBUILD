# This file is rendered by the release workflow. Do not publish it directly;
# the AUR repository receives the rendered PKGBUILD and .SRCINFO.
pkgname=sniplab
_pkgname=snip
pkgver=0.4.0
pkgrel=1
pkgdesc='Filesystem-native snippet library and terminal CLI'
arch=('x86_64' 'aarch64')
url='https://github.com/gitkeniwo/snip'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/gitkeniwo/snip/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
  "$pkgname-$pkgver.tar.gz.asc::https://github.com/gitkeniwo/snip/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc"
)
sha256sums=('163d0edf5d80c0ef565dfcaf61d9f96facd855327b4339d92b2c59e48c1d021c' 'SKIP')
validpgpkeys=('F5B9349D9BDA6EA3327F30BE1DB2F97660CA8B2D')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --locked --release --all-features
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --locked
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/snip "$pkgdir/usr/bin/snip"
  install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
