# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=lhapdf
pkgver=6.1.6
pkgrel=1
pkgdesc="A particle physics tool for evaluating PDFs from discretised data files."
arch=('x86_64' 'i686')
url="http://lhapdf.hepforge.org/"
license=('GPL3')
depends=('python')
makedepends=('boost' 'sed')
install=lhapdf.install
source=(http://www.hepforge.org/archive/lhapdf/LHAPDF-$pkgver.tar.gz)
noextract=()
md5sums=('cbcb12cc5f6f5c763a3a13ce5e31169f')

build() {
	cd "$srcdir/LHAPDF-$pkgver"
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
	sed -i -e "s/'rb'/'r'/g" ${pkgdir}/usr/bin/lhapdf
}
