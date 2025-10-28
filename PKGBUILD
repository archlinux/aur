# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=rivet
pkgver=4.1.2
pkgrel=1
pkgdesc="A particle physics package for data analysis and validation of Monte Carlo event generators"
arch=('x86_64' 'i686')
url="http://rivet.hepforge.org"
license=('GPL3')
depends=('python' 'yoda>=2.1.2' 'fastjet' 'gsl' 'hepmc' 'fastjet-contrib' 'highfive')
optdepends=('texlive-core: Plotting functionality'
            'ghostscript: PDF plot output'
            'imagemagick: PNG plot output')
makedepends=('cython')
source=(http://www.hepforge.org/archive/rivet/Rivet-$pkgver.tar.gz
        )
md5sums=('2275ddcd424e4f123dd54e4803085f00')

package() {
	cd "$srcdir/Rivet-$pkgver"

	./configure --prefix=/usr --with-hepmc3=/usr
	make
        make DESTDIR="$pkgdir/" install

        mkdir -p $pkgdir/etc/bash_completion.d
        mv $pkgdir/usr/share/Rivet/rivet-completion $pkgdir/etc/bash_completion.d
}
