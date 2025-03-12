# Maintainer: Canmi21 <9997200@qq.com>
# Contributor: Canmi(Canmi21)

pkgname=uptrack
pkgver=1.1.0
pkgrel=1
pkgdesc="track your linux uptime into json."
arch=('x86_64')
url="https://github.com/canmi21/uptrack"
license=('MIT')
depends=('glibc' 'acct')
makedepends=('cargo')

source=("git+https://github.com/canmi21/uptrack.git#branch=master"
  "https://raw.githubusercontent.com/canmi21/uptrack/master/LICENSE")

sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir"
  mv uptrack uptrack-$pkgver
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/uptrack "$pkgdir/usr/bin/uptrack"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
