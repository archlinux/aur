pkgname=xeo-fabric
pkgver=0.1.0.r1.g0000000
pkgrel=1
pkgdesc="Matrix-style terminal rain with live system metrics"
arch=('x86_64')
url="https://github.com/xeoxaz/fabric"
license=('MIT')
depends=()
makedepends=('git' 'cargo')
provides=('fabric')
conflicts=('fabric')
source=("git+https://github.com/xeoxaz/fabric.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/fabric"
  printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/fabric"
  cargo build --frozen --release
}

check() {
  cd "$srcdir/fabric"
  cargo test --frozen
}

package() {
  cd "$srcdir/fabric"
  install -Dm755 "target/release/fabric" "$pkgdir/usr/bin/fabric"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
