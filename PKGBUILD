# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: InTeaReable <leyn.the.cat@gmail.com>

pkgname=nyado
pkgver=0.2.5
pkgrel=1
pkgdesc="A Rust todo-list manager with TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/LeynTheCat/nyado"
license=('MIT')
depends=('libgcc')
makedepends=('cargo')
provides=("nyado")
conflicts=("nyado-bin" "nyado-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/LeynTheCat/nyado/archive/v$pkgver.tar.gz")
sha256sums=('911749cd1113a1219a2fbf0c5e02b27eec0cafb7a9fff7446a6678a6011a07c1')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo fetch --locked
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$CARGO_TARGET_DIR/release/nyado" "$pkgdir/usr/bin/nyado"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}