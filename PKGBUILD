# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=cork-rs-git
pkgver=r30.bd62c53
pkgrel=1
pkgdesc="A command-line calculator for hex-lovers"
arch=('x86_64')
url="https://github.com/reddocmd/cork"
license=('GPL')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
  install -Dvm 755 target/release/cork -t "$pkgdir/usr/bin/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
