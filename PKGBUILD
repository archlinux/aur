# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='basicanalysis'
pkgdesc='Framework for automatic extraction of fundamental factors for Paraver traces (from BSC).'
pkgver='0.4.0.20251219'
pkgrel='1'
arch=('any')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL-2.1-or-later')
depends=(python wxparaver dimemas
         python-pandas python-seaborn python-matplotlib python-numpy python-scipy)
optdepends=('gnuplot: Drawing the generated plots')
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2")
sha512sums=(3c734eeb44803a7b1ec2bb6a1717eca68752d114889caec65d818db55bffba64875bd1734215080e8da52808bb7cc1b1f4d8fd66fc70412d500d57c3a46bff2c)

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
