# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='basicanalysis'
pkgdesc='Framework for automatic extraction of fundamental factors for Paraver traces (from BSC).'
pkgver='0.3.8.20201027'
pkgrel='1'
arch=('any')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(python wxparaver dimemas)
optdepends=('gnuplot: Drawing the generated plots'
            'python-pandas: Efficiency table plotting'
            'python-seaborn: Efficiency table plotting'
            'python-matplotlib: Efficiency table plotting'
            'python-numpy: Efficiency table plotting, lineal plotting'
            'python-scipy: Lineal plotting')
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2")
sha512sums=(56a71ff6971780295c133329ee88f1c946399659ce6abc927dacfdbb6c4d068fe937a079d9e249076f036eccca77501cc3a40966d273283f577a3bd1c3e2aba0)

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
