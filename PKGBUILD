# Maintainer: TJ Smith <tj@jarvispro.io>

pkgname='anodizer'
pkgver='0.30.0'
pkgrel=1
pkgdesc='A Rust-native release automation tool'
arch=('aarch64' 'x86_64')
url='https://github.com/tj-smith47/anodizer'
license=('MIT' 'Apache-2.0')
depends=('glibc')
makedepends=('rust' 'cargo')
conflicts=('anodizer')
provides=('anodizer')
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/tj-smith47/anodizer/releases/download/v${pkgver}/anodizer-${pkgver}-source.tar.gz")
sha256sums=('94fabbf2f63af50e5a7df0afd7ae25ebe69298c21b43b0118d996cfee8f44758')

build() {
  cd "$srcdir/anodizer-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "$srcdir/anodizer-${pkgver}"
  install -Dm755 "target/release/anodizer" "$pkgdir/usr/bin/anodizer"
  for _l in LICENSE*; do [ -e "$_l" ] && install -Dm644 "$_l" "$pkgdir/usr/share/licenses/$pkgname/$_l"; done
}