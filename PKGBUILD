# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=wool
pkgver=0.1.2
pkgrel=1
pkgdesc='Preview Github Markdown Offline'
arch=('i686' 'x86_64')
url="https://github.com/grapegrip/wool"
license=('custom:Parity')
depends=()
conflicts=('wool-git' 'asd' 'asd-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        Cargo.lock)
sha256sums=('44f7c3de1056ff3263450dac37f9a1c6bbd0ac6b9a2826c9f58fd17d2765cee6'
            '8a1cee2d0bba13f18f7745f08ca0f4ca4dae29dca5d939c08688158343bbc2dc')

prepare() {
  cd "$pkgname-$pkgver"
  cp ../Cargo.lock .
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/PARITY-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
