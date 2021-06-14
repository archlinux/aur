# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname='glint'
pkgdesc='A tool for creating git commits in the Conventional Commits style'
pkgver='6.3.3'
pkgrel='1'
arch=('x86_64')
url='https://github.com/brigand/glint'
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
checkdepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brigand/glint/archive/v${pkgver}.tar.gz")
sha256sums=('c2ee6c7e52c72c240a228b3d74521b45aae2d0fe2c9e3e89812603c71133d186')

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
