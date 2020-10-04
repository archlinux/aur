# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname='glint'
pkgdesc='A tool for creating git commits in the commitlint style'
pkgver='0.6.0'
pkgrel='1'
arch=('x86_64')
url='https://github.com/brigand/glint'
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
checkdepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brigand/glint/archive/${pkgver}.tar.gz")
sha256sums=('57f6b1fba3e1aa887ca2fdf718b20a2fbabe4d722a9a3e51d3e49176a4e3ae5f')

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
