# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=bingrep-rs
_pkgname=bingrep
pkgver=0.8.5
pkgrel=1
pkgdesc="Cross-platform binary parser and colorizer"
arch=('x86_64')
url="https://github.com/m4b/bingrep"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/m4b/bingrep/archive/v$pkgver.tar.gz)
sha512sums=('cd11c97febaafdce2cfb4894ceee7e60eac5e1b7d85b7b406ea269a871a1af05b0a20be17a643333c1fac63e4d202faa835ca8187a05a92faa29405ddc3a78a5')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 target/release/bingrep "$pkgdir"/usr/bin/bingrep
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
