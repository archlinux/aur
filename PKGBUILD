# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=otree
pkgver=0.3.0
_commit=69e884460f7a986c49c6af8ffe0ca7d1a7b7e2f4
pkgrel=1
pkgdesc="Object Tree TUI Viewer"
arch=('x86_64')
url="https://github.com/fioncat/otree"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver::git+$url#commit=$_commit")
sha512sums=('0290fb80bf65dcc769d74881c25538d6076252d5e90d20407cf6d182fd9e357bc3a8064f8d823708636b8f3d817de95c41715607e35c9978b1bc04f0f7809e80')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
