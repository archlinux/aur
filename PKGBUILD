# Maintainer: Cyrille Pontvieux <cyrille@enialis.net>
pkgname=ezchlog
pkgver=1.2.0
pkgrel=1
pkgdesc="Easy git branch friendly changelogs"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://gitlab.com/jrdasm/ezchlog"
license=('MIT')
makedepends=('cargo')
source=("https://gitlab.com/jrdasm/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('dcc7b791740444fd282b8cc098ac0a7120702ba5eeb1fb4c9b08be2aeef38746')

build() {
  cd "$pkgname-v$pkgver"
  # strip installation info in README
  sed -i '/^Python version$/,/^Add a changelog$/{/^Add a changelog$/!d}' README.md
  cargo build --locked --release
  mv target/release/$pkgname $pkgname
}

package() {
  cd "$pkgname-v$pkgver"
  install -D -t "$pkgdir/usr/bin" $pkgname
  install -D -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
