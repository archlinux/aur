# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=rivet
pkgver=3.1.8
pkgrel=1
pkgdesc="A particle physics package for data analysis and validation of Monte Carlo event generators"
arch=('x86_64' 'i686')
url="http://rivet.hepforge.org"
license=('GPL3')
depends=('python' 'yoda>=1.8.0' 'fastjet' 'gsl' 'hepmc' 'fastjet-contrib')
optdepends=('texlive-core: Plotting functionality'
            'ghostscript: PDF plot output'
            'imagemagick: PNG plot output')
makedepends=('cython')
source=(http://www.hepforge.org/archive/rivet/Rivet-$pkgver.tar.gz
        )
md5sums=('e60c75562572905ed9984c67ada1241b')

package() {
	cd "$srcdir/Rivet-$pkgver"

	./configure --prefix=/usr --with-hepmc3=/usr
	make
        make DESTDIR="$pkgdir/" install

        mkdir -p $pkgdir/etc/bash_completion.d
        mv $pkgdir/usr/share/Rivet/rivet-completion $pkgdir/etc/bash_completion.d
}
