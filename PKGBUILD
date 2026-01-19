# Maintainer: Cyrille Pontvieux <cyrille@enialis.net>
pkgname=ezchlog
pkgver=1.4.0
pkgrel=1
pkgdesc="Easy git branch friendly changelogs"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://gitlab.com/snake_coders/ezchlog"
license=('MIT')
makedepends=('cargo')
source=("https://gitlab.com/snake_coders/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('c6ad8cabc74f12f6a808018f329f0dd4491f8e76b1009bbca310c4d9b5407e98')

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
