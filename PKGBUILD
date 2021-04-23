# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgname=provok-git
pkgver=0.1.0.r5.g93ed61e
pkgrel=1
pkgdesc="A text renderer written in Rust"
arch=('x86_64')
url="https://github.com/o2sh/provok"
license=('MIT')
groups=()
depends=('freetype2' 'harfbuzz')
makedepends=('git' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
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
  install -Dvm 755 target/release/provok -t "$pkgdir/usr/bin/"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
