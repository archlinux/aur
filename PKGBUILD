# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Juergen Graefe <jg72@gmx.de>
pkgname=colormake
_pkgname=Colormake
pkgver=0.9
pkgrel=2
pkgdesc="A simple wrapper around make to make it's output more readable."
arch=('any')
url="http://bre.klaki.net/programs/colormake/"
license=('GPL2')
conflicts=('colormake-git')
depends=('bash' 'perl')
source=($pkgname-$pkgver.tar.gz::https://github.com/pagekite/Colormake/archive/$pkgver.tar.gz)


prepare() {
	cd $srcdir/$_pkgname-$pkgver

	# adjust scripts to colormake.pl path
	sed -i 's#colormake.pl#/usr/share/colormake/colormake.pl#g' \
		colormake{,-short} clmake*
}

package() { 
	cd $srcdir/$_pkgname-$pkgver

	# executables
	install -dm755 $pkgdir/usr/bin
	install -m755 colormake colormake-short clmake clmake-short $pkgdir/usr/bin

	install -Dm755 colormake.pl $pkgdir/usr/share/$pkgname/colormake.pl

	# man page
	install -Dm644 colormake.1 $pkgdir/usr/share/man/man1/colormake.1

	# documentation
	install -dm755 $pkgdir/usr/share/doc/$pkgname
	install -m644 \
		AUTHORS \
		BUGS \
		ChangeLog \
		README \
		$pkgdir/usr/share/doc/$pkgname
}

md5sums=('61b3e5a844cfca19675b6f79d70ca3d3')
