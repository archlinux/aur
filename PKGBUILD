# Maintainer: TJ Smith <tj@jarvispro.io>

pkgname='anodizer'
pkgver='0.23.0'
pkgrel=1
pkgdesc="A Rust-native release automation tool"
arch=('aarch64' 'x86_64')
url='https://github.com/tj-smith47/anodizer'
license=('MIT' 'Apache-2.0')
depends=('glibc')
makedepends=('rust' 'cargo')
conflicts=('anodizer')
provides=('anodizer')
source=("https://github.com/tj-smith47/anodizer/archive/refs/tags/v0.23.0.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/anodizer-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/anodizer-$pkgver"
  install -Dm755 "target/release/anodizer" "$pkgdir/usr/bin/anodizer"
  for _l in LICENSE*; do [ -e "$_l" ] && install -Dm644 "$_l" "$pkgdir/usr/share/licenses/$pkgname/$_l"; done
}