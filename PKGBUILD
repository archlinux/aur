# Maintainer: Gyara <laxect39@gmail.com>

pkgname=cargo-feature-git
_pkgname=cargo-feature
pkgver=r36.ee38538
pkgrel=1
pkgdesc="Allows conveniently modify features of crate"
url="https://github.com/Riey/cargo-feature"
conflicts=('cargo-feature')
provides=('cargo-feature')
depends=('cargo')
makedepends=('git')
arch=('i686' 'x86_64')
license=('MIT')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname/"
  cargo build --release --target-dir=target
}

package() {
  cd "$srcdir/$_pkgname/"
  install -Dm755 "target/release/cargo-feature" "$pkgdir/usr/bin/cargo-feature"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
