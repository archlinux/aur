# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=kiro-git
pkgver=0.4.3.r3.g4ba92af
pkgrel=1
pkgdesc="A tiny UTF-8 text editor"
arch=('x86_64')
url="https://github.com/rhysd/kiro-editor"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=('kiro')
conflicts=('kiro')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$pkgname"
  cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "$pkgname"
  cargo test --release --locked --target-dir=target
}

package() {
  cd "$pkgname"
  install -Dm 755 target/release/kiro -t "$pkgdir/usr/bin/"
  install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
