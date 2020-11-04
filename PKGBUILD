# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname='glint'
pkgdesc='A tool for creating git commits in the Conventional Commits style'
pkgver='6.1.0'
pkgrel='1'
arch=('x86_64')
url='https://github.com/brigand/glint'
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
checkdepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brigand/glint/archive/v${pkgver}.tar.gz")
sha256sums=('7d5c244f573246832b5c50e385054f2350c4c47f48c204f49cbd788e35bd4aac')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/glint" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
