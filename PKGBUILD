# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=yoda
pkgver=1.5.5
pkgrel=1
pkgdesc="A particle physics package for data analysis (specifically histogramming) classes."
arch=('x86_64' 'i686')
url="http://yoda.hepforge.org"
license=('GPL2')
depends=('python2')
makedepends=('cython2' 'boost' 'autoconf' 'libtool' 'automake')
source=(http://www.hepforge.org/archive/yoda/YODA-$pkgver.tar.gz)
md5sums=('6b814ced099c9a0e7fad7930071146e5')

prepare() {
	cd "$srcdir/YODA-$pkgver"
        sed -e 's/\/usr\/bin\/env python$/\/usr\/bin\/env python2/g' -i bin/* pyext/yoda/mktemplates pyext/setup.py.in
        sed -e 's/cython /cython2 /g' -i pyext/yoda/Makefile.am
}

build() {
	cd "$srcdir/YODA-$pkgver"
        export PYTHON=/usr/bin/python2
        autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/YODA-$pkgver"
	make DESTDIR="$pkgdir/" install
        mkdir -p $pkgdir/etc/bash_completion.d
        mv $pkgdir/usr/share/YODA/yoda-completion $pkgdir/etc/bash_completion.d
}
