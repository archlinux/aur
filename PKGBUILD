# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname='glint'
pkgdesc='A tool for creating git commits in the commitlint style'
pkgver='0.2.1'
pkgrel='1'
arch=('x86_64')
url='https://github.com/brigand/glint'
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
checkdepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brigand/glint/archive/${pkgver}.tar.gz")
sha256sums=('1e18657cfa3a0012c09629db91b9193e8fa96d8b23c9c5ce4ba9d4620cd79888')

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
