# Maintainer: shtrophic <aur at shtrophic dot net>

pkgname=wicuvanity
pkgver=1.1
pkgrel=1
pkgdesc='Generate wireguard vanity keys on your Nvidia GPU'
arch=('x86_64')
url='https://git.sr.ht/~shtrophic/wicuvanity'
license=('MIT')
makedepends=('meson' 'cxxopts')
depends=('cuda')

source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::$url/archive/$pkgver.tar.gz.asc"
)
validpgpkeys=(10F1CC925057D456798EBF9C1B3EB6FE2D338B4A)
sha256sums=('2b83867ef2c08f2c16a50869bb600bfbc410b246932e5e7b532e3be9844532d5'
            'SKIP')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	
	LDFLAGS= meson setup builddir --buildtype release --prefix /usr
	meson compile -C builddir
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	meson install -C builddir --destdir "$pkgdir"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
