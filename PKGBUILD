# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=vault-tasks
pkgver=0.13.0
pkgrel=1
pkgdesc="A TUI Markdown Task Manager"
arch=('x86_64')
url="https://github.com/louis-thevenet/vault-tasks"
license=('MPL-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b4127f96025b526746c0360c42adf458d0c08804027567b260b82962ca9fa553')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  VERGEN_GIT_DESCRIBE="Arch Linux" cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
