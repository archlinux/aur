# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs
_pkgname=dotter
pkgver=0.12.3
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname")
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5b6d03415ac20fc832ae35681a3a890df57bd908765f3b4ec70946216655ac0edc411d7d14f31f003e932aeb7cdedd7d756c307e91c119c8c95412d2f6af37e6')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked --features handlebars_misc_helpers
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --release --locked --features handlebars_misc_helpers
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
