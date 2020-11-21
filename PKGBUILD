# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
# Maintainer: Ossama Hjaji <ossama-hjaji@live.fr>
pkgname=onefetch
pkgver=2.7.2
pkgrel=1
pkgdesc="Git repository summary on your terminal"
url="https://github.com/o2sh/onefetch"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('libgit2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('158126b087805d653ffdc9cceb7afcf6ff053e4285c7be5bc4be5a7bfe636524')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --all-features --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  install -Dm755 "$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname-$pkgver/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
