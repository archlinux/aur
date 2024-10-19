# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='basicanalysis'
pkgdesc='Framework for automatic extraction of fundamental factors for Paraver traces (from BSC).'
pkgver='0.3.9.20241018'
pkgrel='1'
arch=('any')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(python wxparaver dimemas
         python-pandas python-seaborn python-matplotlib python-numpy python-scipy)
optdepends=('gnuplot: Drawing the generated plots')
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2")
sha512sums=(77f77d6bd0b49c4769a25fa317e52460a9f076960d8ea1e5f485a10d88c6d68e40d170927765f38746c6d0e55b75396e438243b3f508a0fe361d0df7233dcd6e)

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
