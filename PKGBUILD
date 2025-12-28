# Maintainer: Serhii Novytskyi <novickii.sergei.nure@gmail.com>
pkgname=pgdr
pkgver=1.0.0
pkgrel=1
pkgdesc="Cryptographically secure password generator powered by kernel entropy"
arch=('x86_64' 'aarch64')
url="https://github.com/sergik776/pgdr"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cross')
source=("git+https://github.com/sergik776/pgdr.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cross build --target=${CARCH}-unknown-linux-gnu --release --frozen
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/${CARCH}-unknown-linux-gnu/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
