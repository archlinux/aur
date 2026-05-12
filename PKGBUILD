# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: InTeaReable <leyn.the.cat@gmail.com>

pkgname=nyado
pkgver=0.3.2
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
sha256sums=('84fe0a57195d87588fa269ec706d4ecdb5dc83de76bcb261d9a32b87c2c5a453')

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