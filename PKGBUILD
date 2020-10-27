# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
# Maintainer: Ossama Hjaji <ossama-hjaji@live.fr>
pkgname=onefetch
pkgver=2.5.0
pkgrel=1
pkgdesc="Git repository summary on your terminal"
url="https://github.com/o2sh/onefetch"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('libgit2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1f4d34f70fc38d453f875c40852c535a5c5b011563262209976ecaf028a664c6')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --all-features --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  install -Dm755 "$pkgname-$pkgver/target/release/onefetch" "$pkgdir/usr/bin/onefetch"
  install -Dm644 "$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
