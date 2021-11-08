# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: lilydjwg <lilydjwg@gmail.com>

pkgname=fbcat
pkgver=0.5.2
pkgrel=3
pkgdesc="Framebuffer screenshot tool"
arch=('x86_64' 'i686')
url="https://github.com/jwilk/fbcat"
license=("GPL2")
optdepends=('imagemagick' 'netpbm' 'graphicsmagick')
makedepends=('docbook-xsl')
provides=('fbgrab')
conflicts=('fbgrab')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('062ebd198814666bd1672ffadf2c820c344fc003d6e164ec968fac233b70061f'
            'SKIP')
validpgpkeys=('CDB5A1243ACDB63009AD07212D4EB3A6015475F5')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i -e '/PREFIX/s/=/?=/' -e '/DESTDIR/s/=/?=/' Makefile
}

build() {
	make -C "$pkgname-$pkgver"
	make -C "$pkgname-$pkgver/doc"
}

package() {
	make -C "$pkgname-$pkgver" install PREFIX=/usr DESTDIR="$pkgdir/"
}

# vim:syntax=sh
