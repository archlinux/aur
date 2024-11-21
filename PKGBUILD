# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=vault-tasks
pkgver=0.4.0
pkgrel=1
pkgdesc="A TUI Markdown Task Manager"
arch=('x86_64')
url="https://github.com/louis-thevenet/vault-tasks"
license=('MPL-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1e78325a4bf4f3a42934920f7a7086d834dbc0696475d2cf8be6b0c168cb35f1')

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
