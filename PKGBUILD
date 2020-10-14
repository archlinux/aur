# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname='glint'
pkgdesc='A tool for creating git commits in the commitlint style'
pkgver='6.0.2'
pkgrel='1'
arch=('x86_64')
url='https://github.com/brigand/glint'
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
checkdepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brigand/glint/archive/v${pkgver}.tar.gz")
sha256sums=('e1a762b7e5de252b4b5bf50e4707d0e94a8f75807c673b98c4534222793e9764')

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
