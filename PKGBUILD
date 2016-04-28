# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=sherpa
pkgver=2.2.0
pkgrel=1
pkgdesc="A particle physics package for Monte Carlo simulation of collider events."
arch=('x86_64' 'i686')
url="http://sherpa.hepforge.org"
license=('GPL3')
depends=('lhapdf' 'fastjet' 'hepmc' 'openmpi' 'openloops')
source=(http://www.hepforge.org/archive/sherpa/SHERPA-MC-$pkgver.tar.gz)
md5sums=('eeab101fe4eb4eef0f87ccb525ca19a3')

build() {
	cd "$srcdir/SHERPA-MC-$pkgver"
	./configure --prefix=/usr --enable-hepmc2=/usr --enable-fastjet=/usr --enable-lhapdf=/usr --enable-lhole --enable-openloops=. --enable-mpi --enable-openloops=/usr/lib/openloops
	make
}

package() {
	cd "$srcdir/SHERPA-MC-$pkgver"
	make DESTDIR="$pkgdir/" install
        for i in get_bibtex init_nlo.sh plot_graphs.sh; do
            mv $pkgdir/usr/bin/$i $pkgdir/usr/share/SHERPA-MC/
        done
}
