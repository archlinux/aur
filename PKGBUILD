# Maintainer: Sir-Photch <sir-photch at posteo dot me>

pkgname=wicuvanity
pkgver=1.0
pkgrel=1
pkgdesc='Generate wireguard vanity keys on your Nvidia GPU'
arch=('x86_64')
url='https://git.sr.ht/~chrs/wicuvanity'
license=('MIT')
makedepends=('meson' 'cxxopts')
depends=('cuda')

source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::$url/archive/1.0.tar.gz.asc"
)
validpgpkeys=(10F1CC925057D456798EBF9C1B3EB6FE2D338B4A)
sha256sums=('b3a09f0a6745ada75209df14c18a94ddae82d80e906ec8483b7bf0388b9ebdf3'
            'SKIP')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	meson setup builddir --buildtype release --prefix=/usr
	meson compile -C builddir
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	meson install -C builddir --destdir "$pkgdir"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
