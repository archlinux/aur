# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=onefetch
pkgver=2.2.0
pkgrel=1
pkgdesc="Git repository summary on your terminal"
url="https://github.com/o2sh/onefetch"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('gcc-libs' 'zlib')
makedepends=('cargo')
source=("$pkgname-$pkgver::$url/archive/v$pkgver.tar.gz")
sha256sums=('99e00a760670ac3e8653762fe690f37ce8214470d2887c37aeb778c2c1344734')

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
