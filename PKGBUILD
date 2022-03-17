# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=rivet
pkgver=3.1.5
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
        https://gitlab.com/hepcedar/rivet/-/commit/efb47ae662431c08ae4deec046bff0c56a8119ab.diff
        )
md5sums=('7f3397b16386c0bfcb49420c2eb395b1'
         'f2ffdbf1800e2ba8eec23e10d3785d33')

package() {
	cd "$srcdir/Rivet-$pkgver"
        patch -p1 < $srcdir/efb47ae662431c08ae4deec046bff0c56a8119ab.diff
        autoreconf -i

	./configure --prefix=/usr --with-hepmc3=/usr
	make
        make DESTDIR="$pkgdir/" install

        mkdir -p $pkgdir/etc/bash_completion.d
        mv $pkgdir/usr/share/Rivet/rivet-completion $pkgdir/etc/bash_completion.d
}
