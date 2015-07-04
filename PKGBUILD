# Contributor: Dirk Sohler <spam@0x7be.de>               
# Maintainer: Dirk Sohler <spam@0x7be.de>
# vim: ts=4:sw=4

pkgname=mar-git
_gitname=mar
pkgver=2.0.2
pkgrel=2
pkgdesc='An intuitive syntax mass file renamer'

url='http://dev.0x7be.de/mar.html'
arch=('any')
license=('GPL')

depends=('python>=3.0')
makedepends=('git')

branch='master'

source=("git://github.com/dsohler/mar.git#branch=$branch"
		"mar.1")

sha256sums=('SKIP'
			'6b6fe3691becdd9e7750a2bc9f71042fbe65adeb44a8af5c5d1cf136cb783256')

pkgver() {
	cd "$srcdir/$_gitname"
	echo $(sed -n "s/^progversion = '\(.*\)'/\1/p" mar.py)
}

package() {
	cd "$srcdir/$_gitname"
	install -Dm 755 mar.py $pkgdir/usr/bin/mar
	install -Dm 644 ../mar.1 $pkgdir/usr/share/man/man1/mar.1
	gzip $pkgdir/usr/share/man/man1/mar.1
}
