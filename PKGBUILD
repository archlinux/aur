# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='basicanalysis'
pkgdesc='Framework for automatic extraction of fundamental factors for Paraver traces (from BSC).'
pkgver='0.3.9.20210623'
pkgrel='1'
arch=('any')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(python wxparaver dimemas
         python-pandas python-seaborn python-matplotlib python-numpy python-scipy)
optdepends=('gnuplot: Drawing the generated plots')
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2")
sha512sums=(7f47de32b226fb15525021c89c3a04f20eb44e49b52f8d5c972ddf9955b089e863c6e44b7f4f2ef637b0654236158549e36bb801417aa4b8c6db0dc1a219b4bf)

package() {
	# Install script and configurations in /usr/lib/basicanalysis
	cd "$srcdir/$pkgname-${pkgver%.*}-src"
	install -d -m755 "$pkgdir/usr/lib/basicanalysis/cfgs/"
	find "." -type f -name "*.py" -exec install -D -m755 "{}" "$pkgdir/usr/lib/basicanalysis/" \;
	find "cfgs" -type f -exec install -D -m644 "{}" "$pkgdir/usr/lib/basicanalysis/cfgs/" \;
	rm "$pkgdir/usr/lib/basicanalysis/cfgs/.directory" # Remove crap

	# Create a symlink to the main script in /usr/bin for ease of use
	mkdir -p "$pkgdir/usr/bin"
	chmod 0755 "$pkgdir/usr/bin" "$pkgdir/usr"
	ln -s "/usr/lib/basicanalysis/modelfactors.py" "$pkgdir/usr/bin/modelfactors.py"
}
