# Maintainer: Ke Liu <spcter119@gmail.com>
# Contributor: Adrian Hühn <adrian.huehn@web.de>
# Contributor: Vit <vitruss@gmail.com>

pkgname=xcrysden
pkgver=1.6.2
pkgrel=2
epoch=
pkgdesc="crystalline and molecular structure visualisation program"
arch=('x86_64')
url="http://www.xcrysden.org/"
license=('GPL2')
depends=('tk' 'tcl' 'tk-togl' 'gl2ps' 'fftw' 'bwidget' 'imagemagick' 'gcc-fortran' 'glu' 'libxmu')
replaces=('xcrysden-bin')
source=("http://www.xcrysden.org/download/xcrysden-${pkgver}.tar.gz"
        "fix-xcrysden-install.patch"
        "Make.sys")
sha256sums=('811736ee598bec1a5b427fd10e4e063a30dd7cadae96a43a50b36ce90a4f503f'
            '26be6f6d22bed326612f2b9c4b049a32bc9ebe57926254eac1d0e5ee46cb9ca5'
            '0d2f5e60f694e0c71f0cdb265cbd753cd73dcbf1fc708cb35a844248c3a509f2')

prepare() {
	mv Make.sys "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	patch -p1 -i $srcdir/fix-xcrysden-install.patch
}

build() {
	cd "$pkgname-$pkgver"
	make xcrysden
}

package() {
	cd "$pkgname-$pkgver"
	prefix=$pkgdir/usr make install
}
