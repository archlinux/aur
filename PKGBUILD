# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='basicanalysis'
pkgdesc='Framework for automatic extraction of fundamental factors for Paraver traces (from BSC).'
pkgver='0.3.6.20180531'
pkgrel='1'
arch=('any')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(python python-scipy python-numpy)
optdepends=('gnuplot: For drawing the generated plots')
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2")
sha512sums=(94fac4171454978c1f3a27ec29e0c407413008b491ffe9aed2f7915ef9e5d3f7b2cdbc155ba00aa3e426b261ca259e1c00b59ffdde941bbb6a3cc49194827897)

package() {
	# Install script and configurations in /usr/lib/basicanalysis
	cd "$srcdir/$pkgname-${pkgver%.*}"
	install -d -m755 "$pkgdir/usr/lib/basicanalysis/cfgs/"
	install -D -m755 "modelfactors.py" "$pkgdir/usr/lib/basicanalysis/"
	find "cfgs" -type f -exec install -D -m644 "{}" "$pkgdir/usr/lib/basicanalysis/cfgs/" \;

	# Create a symlink to the script in /usr/bin for ease of use
	mkdir -p -m755 "$pkgdir/usr/bin"
	ln -s "/usr/lib/basicanalysis/modelfactors.py" "$pkgdir/usr/bin/modelfactors.py"
}