# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=vault-tasks
pkgver=0.5.1
pkgrel=1
pkgdesc="A TUI Markdown Task Manager"
arch=('x86_64')
url="https://github.com/louis-thevenet/vault-tasks"
license=('MPL-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a839a71b7e26eb65291bbdd2ec46a65c6da1d70cf5ef0cc176cc208e9e49d9b3')

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
