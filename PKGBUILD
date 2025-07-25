# Maintainer: Cyrille Pontvieux <cyrille@enialis.net>
pkgname=ezchlog
pkgver=1.1.0
pkgrel=1
pkgdesc="Easy git branch friendly changelogs"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://gitlab.com/jrdasm/ezchlog"
license=('MIT')
makedepends=('cargo')
source=("https://gitlab.com/jrdasm/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('400c8047d6c6ffd83934c3815dfd44a5a49e2d00d9ac049af8b0a89b29f8fbcc')

build() {
	cd "$pkgname-v$pkgver"
  sed -i '/^Python version$/,/^Add a changelog$/{/^Add a changelog$/!d}' README.md
	cargo build --locked --release
  mv target/release/$pkgname $pkgname
}

package() {
	cd "$pkgname-v$pkgver"
  install -D -t "$pkgdir/usr/bin" $pkgname
  install -D -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
