# Maintainer: Cyrille Pontvieux <cyrille@enialis.net>
pkgname=ezchlog
pkgver=1.0.2
pkgrel=1
pkgdesc="Easy git branch friendly changelogs"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://gitlab.com/jrdasm/ezchlog"
license=('MIT')
makedepends=('cargo' 'upx')
source=("https://gitlab.com/jrdasm/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('6645731df2b4f9dc524288b25c2f199280b7b8f2923286f8f41f137279f2e745')

build() {
	cd "$pkgname-v$pkgver"
  sed -i '/^Python version$/,/^Add a changelog$/{/^Add a changelog$/!d}' README.md
	cargo build --locked --release
  upx --lzma --best -o $pkgname target/release/$pkgname
}

package() {
	cd "$pkgname-v$pkgver"
  install -D -t "$pkgdir/usr/bin" $pkgname
  install -D -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
