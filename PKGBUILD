# Maintainer <thysupremematrix a-t tuta d_o_t io>
pkgname=gimp-plugin-fourier-git
pkgver=0.4.4.r0.g35e2cfe
pkgrel=1
pkgdesc="Fourier plugin for GIMP"
arch=('x86_64')
url="https://github.com/rpeyron/plugin-gimp-fourier"
license=('GPL')
depends=('git' 'gimp' 'fftw')
source=($pkgname::git+https://github.com/rpeyron/plugin-gimp-fourier)
md5sums=('SKIP')

pkgver() {
	cd $srcdir/$pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
 }

prepare() {
	cd $srcdir/$pkgname
	autoreconf -i
	automake --foreign -Wall
}

build() {
	cd $pkgname
	./configure
	make
}

package() {
	cd $srcdir/$pkgname
	DESTDIR="$pkgdir" make install
	
	# move from /usr/local to /usr
	mv $pkgdir/usr/local/* $pkgdir/usr
	rmdir $pkgdir/usr/local
}
