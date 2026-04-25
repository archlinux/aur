# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='basicanalysis'
pkgdesc='Framework for automatic extraction of fundamental factors for Paraver traces (from BSC).'
pkgver='0.5.1.20260423'
pkgrel='1'
arch=('any')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL-2.1-or-later')
depends=(python wxparaver dimemas
         python-pandas python-seaborn python-matplotlib python-numpy python-scipy)
optdepends=('gnuplot: Drawing the generated plots')
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2")
sha512sums=(d626f74f97ed148dea910bf3cc41ae98650867ce3d0430e1e307151d67d15b2184e370a146d59681fcc33430f0fb8abc8cdcd59efcc7116188bd523014d3e484)

package() {
	# Install script and configurations in /usr/lib/basicanalysis
	cd "$srcdir/$pkgname-${pkgver%.*}"
	install -d -m755 "$pkgdir/usr/lib/basicanalysis/cfgs/"
	find "." -type f -name "*.py" -exec install -D -m755 "{}" "$pkgdir/usr/lib/basicanalysis/" \;
	find "cfgs" -type f -exec install -D -m644 "{}" "$pkgdir/usr/lib/basicanalysis/cfgs/" \;
	rm "$pkgdir/usr/lib/basicanalysis/cfgs/.directory" # Remove crap

	# Create a symlink to the main script in /usr/bin for ease of use
	mkdir -p "$pkgdir/usr/bin"
	chmod 0755 "$pkgdir/usr/bin" "$pkgdir/usr"
	ln -s "/usr/lib/basicanalysis/modelfactors.py" "$pkgdir/usr/bin/modelfactors.py"
}
