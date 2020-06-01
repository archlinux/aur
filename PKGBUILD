# Maintainer: Jay Ta'ala <jay@jaytaala.com>
pkgname=chart-geany
pkgver=6.1.5
pkgrel=1
pkgdesc="Chart Geany is a free cross platform software solution for market technical analysis, charting and a portfolio manager."
arch=('any')
url="https://chart-geany.sourceforge.io/"
license=('GPL2')
depends=('qtwebkit-bin' 'libxls')
makedepends=('clang')
source=("$pkgname-$pkgver.tar.gz::https://sourceforge.net/projects/chart-geany/files/6.0/chartgeany-6.1.5.tar.gz/download")
md5sums=('c2f0acdc7025de66ff6cbcba65212751')

prepare() {
	_dirname=$(bsdtar -tf "${source[0]%%::*}" | awk -F / '{print $1; exit}')
	mv "$_dirname" $pkgname-$pkgver
}

build() {
	cd "$pkgname-$pkgver"/ChartGeany
	./makeclang.sh
}

package() {
	cd "$pkgname-$pkgver"/ChartGeany
	make INSTALL_ROOT="$pkgdir/" install
}
