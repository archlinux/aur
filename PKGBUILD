# Maintainer: Jay Ta'ala <jay@jaytaala.com>
pkgname=chart-geany
pkgver=6.2.0
pkgrel=2
pkgdesc="Chart Geany is a free cross platform software solution for market technical analysis, charting and a portfolio manager."
arch=('any')
url="https://chart-geany.sourceforge.io/"
license=('GPL2')
depends=('qtwebkit-bin' 'libxls')
makedepends=('clang')
source=("$pkgname-$pkgver.tar.gz::https://sourceforge.net/projects/chart-geany/files/6.0/chartgeany-$pkgver.tar.gz/download")
md5sums=('7ff5762dd8edd70746c71539dfe5640e')

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
	make INSTALL_ROOT="$pkgdir/" install_target
        
        # copy icon to /opt/chartgeany
        install -D -m644 "./images/chartgeany.png" "$pkgdir/opt/chartgeany/chartgeany.png"

        # copy desktop file to /usr/share/applications
        install -D -m644 "$startdir/chartgeany.desktop" "$pkgdir/usr/share/applications/chartgeany.desktop"
}
