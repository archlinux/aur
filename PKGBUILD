# This file is rendered by the release workflow. Do not publish it directly;
# the AUR repository receives the rendered PKGBUILD and .SRCINFO.
pkgname=sniplab
_pkgname=snip
pkgver=0.3.0
pkgrel=1
pkgdesc='Filesystem-native snippet library and terminal CLI'
arch=('x86_64' 'aarch64')
url='https://github.com/gitkeniwo/snip'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gitkeniwo/snip/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41b165671d6a5ef8da0d23145b6f6ac79a36353ce83c08656b9d4f524a9f699b')

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
