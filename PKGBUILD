# Maintainer: Ke Liu <spcter119@gmail.com>
# Contributor: Adrian Hühn <adrian.huehn@web.de>
# Contributor: Vit <vitruss@gmail.com>

pkgname=xcrysden
pkgver=1.6.2
pkgrel=1
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
            '26d0dc9fc40d575f39d21c06220187d3b98cc4255f5d7ca7468c2aeea636a32a')

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
