# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=onefetch
pkgver=2.3.0
pkgrel=1
pkgdesc="Git repository summary on your terminal"
url="https://github.com/o2sh/onefetch"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('gcc-libs' 'zlib')
makedepends=('cargo')
source=("$pkgname-$pkgver::$url/archive/v$pkgver.tar.gz")
sha256sums=('6091a0411a4278cd2de9f78d451188440c084ed944a48451adb77bc7d2e0d54f')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release
}

package() {
  install -Dm755 "$pkgname-$pkgver/target/release/onefetch" "$pkgdir/usr/bin/onefetch"
  install -Dm644 "$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
