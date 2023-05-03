# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=sherpa
pkgver=2.2.15
pkgrel=1
pkgdesc="A particle physics package for Monte Carlo simulation of collider events."
arch=('x86_64' 'i686')
url="http://sherpa.hepforge.org"
license=('GPL3')
depends=('lhapdf' 'fastjet' 'hepmc' 'hepmc2' 'openmpi' 'openloops' 'rivet')
source=(http://www.hepforge.org/archive/sherpa/SHERPA-MC-$pkgver.tar.gz)
md5sums=('33947bb014b2662092b105a2c9320ba2')

build() {
	cd "$srcdir/SHERPA-MC-$pkgver"
	./configure --prefix=/usr --enable-hepmc2=/usr --enable-hepmc3=/usr --enable-fastjet=/usr --enable-lhapdf=/usr --enable-lhole --enable-openloops=. --enable-mpi --enable-openloops=/usr/lib/openloops --enable-rivet=/usr CXXFLAGS=-std=c++17
	make
}

package() {
	cd "$srcdir/SHERPA-MC-$pkgver"
	make DESTDIR="$pkgdir/" install
        for i in get_bibtex init_nlo.sh plot_graphs.sh; do
            mv $pkgdir/usr/bin/$i $pkgdir/usr/share/SHERPA-MC/
        done
}
