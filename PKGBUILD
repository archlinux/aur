# Maintainer: Sir-Photch <sir-photch at posteo dot me>

pkgname=wicuvanity
pkgver=1.0
pkgrel=1
pkgdesc='Generate wireguard vanity keys on your Nvidia GPU'
arch=('x86_64')
url='https://github.com/Sir-Photch/wicuvanity'
license=('MIT')
makedepends=('meson' 'cxxopts')
depends=('cuda')

source=("$pkgname-$pkgver.tar.gz::https://github.com/Sir-Photch/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('996e33564021219b29925ab1fe852c2c989bd395eb453774032bfeb2ed3d05a9')

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
