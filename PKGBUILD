# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=lhapdf
pkgver=6.1.5
pkgrel=1
pkgdesc="A particle physics tool for evaluating PDFs from discretised data files."
arch=('x86_64' 'i686')
url="http://lhapdf.hepforge.org/"
license=('GPL3')
depends=('python2')
makedepends=('boost' 'autoconf' 'libtool' 'automake')
install=lhapdf.install
source=(http://www.hepforge.org/archive/lhapdf/LHAPDF-$pkgver.tar.gz)
noextract=()
md5sums=('7396c93b9e956fb1cfa4dbfea84494bc')

prepare() {
	cd "$srcdir/LHAPDF-$pkgver"
        sed -e 's/\/usr\/bin\/env python$/\/usr\/bin\/env python2/g' -i lhapdf.in examples/testpdfunc.py examples/pythonexample.py doc/mkpdflist wrappers/python/setup.py.in mkindex
        sed -e 's/cython /cython2 /g' -i wrappers/python/Makefile.am
}

build() {
	cd "$srcdir/LHAPDF-$pkgver"
        export PYTHON=/usr/bin/python2
        autoreconf -i
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/LHAPDF-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/LHAPDF-$pkgver"
	make DESTDIR="$pkgdir/" install
}
