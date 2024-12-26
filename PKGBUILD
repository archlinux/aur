# Maintainer: piratecarrot <39475419+piratecarrot@users.noreply.github.com>
pkgname=mrcal-git
pkgver=v2.4.1.r730.gc8e24d00
pkgrel=1
pkgdesc="mrcal is a generic toolkit built to solve the calibration and SFM-like problems we encounter at NASA/JPL."
arch=('i686' 'x86_64')
url="http://mrcal.secretsauce.net/"
license=('Apache-2.0')
depends=('libdogleg'
         'python'
         'python-numpy'
         'python-numpysane'
         'python-scipy'
         'python-opencv'
         'python-shapely'
         'python-matplotlib')
makedepends=('make' 'gcc' 'perl-list-moreutils' 're2c' 'mrbuild' 'python-numpy')
optdepends=('mrgingham')
provides=('mrcal')
conflicts=('mrcal')
source=("${pkgname%-git}::git+https://github.com/dkogan/mrcal.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags --match 'v*' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	CFLAGS=`numpy-config --cflags`
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR=$pkgdir install
}
