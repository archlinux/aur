# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=rivet
pkgver=4.1.5
pkgrel=1
pkgdesc="A particle physics package for data analysis and validation of Monte Carlo event generators"
arch=('x86_64' 'i686')
url="http://rivet.hepforge.org"
license=('GPL3')
depends=('python' 'yoda>=2.1.5' 'fastjet' 'gsl' 'hepmc' 'fastjet-contrib' 'highfive')
optdepends=('texlive-core: Plotting functionality'
            'ghostscript: PDF plot output'
            'imagemagick: PNG plot output')
makedepends=('cython')
source=(https://cedar-tools.web.cern.ch/downloads/Rivet-$pkgver.tar.gz
        )
md5sums=('3b0076c6cc233e1258809b6284abb7bb')

package() {
	cd "$srcdir/Rivet-$pkgver"

	./configure --prefix=/usr --with-hepmc3=/usr
	make
        make DESTDIR="$pkgdir/" install

        mkdir -p $pkgdir/etc/bash_completion.d
        mv $pkgdir/usr/share/Rivet/rivet-completion $pkgdir/etc/bash_completion.d
}
