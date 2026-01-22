# Maintainer: Matthew Tran <0e4ef622 at gmail.com>
# Contributor: piratecarrot <39475419+piratecarrot@users.noreply.github.com>
pkgname=mrgingham-git
pkgver=v1.26.r4.gbabc35d
pkgrel=1
pkgdesc="Chessboard corner-finder for a camera calibration system "
arch=('i686' 'x86_64')
url="https://github.com/dkogan/mrgingham"
license=('LGPL-2.1-or-later')
depends=('bash'
         'gcc-libs'
         'glibc'
         'opencv'
         'python'
         'python-gnuplotlib'
         'python-numpy'
         'python-numpysane'
         'python-scipy'
         'vnlog'
        )
makedepends=(
    'make'
    'gcc'
    'mawk'
    'mrbuild'
    'boost'
    'python-numpy')
provides=('mrgingham')
conflicts=('mrgingham')
source=("${pkgname%-git}::git+https://github.com/dkogan/mrgingham.git#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	CFLAGS=`numpy-config --cflags`
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR=$pkgdir USRLIB=/usr/lib install
}
