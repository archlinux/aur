# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=rivet
pkgver=2.2.1
pkgrel=1
pkgdesc="A particle physics package for data analysis and validation of Monte Carlo event generators"
arch=('x86_64' 'i686')
url="http://rivet.hepforge.org"
license=('GPL2')
depends=('python2' 'yoda' 'fastjet' 'gsl' 'hepmc')
makedepends=('cython2' 'boost' 'autoconf' 'libtool' 'automake')
source=(http://www.hepforge.org/archive/rivet/Rivet-$pkgver.tar.gz)
md5sums=('4b6a3abb05ca548825e266f5478cd396')

prepare() {
	cd "$srcdir/Rivet-$pkgver"
        sed -e 's/\/usr\/bin\/env python$/\/usr\/bin\/env python2/g' -i bin/* doc/* pyext/setup.py.in pyext/rivet/spiresbib.py
        sed -e 's/cython /cython2 /g' -i pyext/rivet/Makefile.am
}

build() {
	cd "$srcdir/Rivet-$pkgver"
        export PYTHON=/usr/bin/python2
        autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/Rivet-$pkgver"
	make DESTDIR="$pkgdir/" install
        mkdir -p $pkgdir/etc/bash_completion.d
        mv $pkgdir/usr/share/Rivet/rivet-completion $pkgdir/etc/bash_completion.d
}
