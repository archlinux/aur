# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Juergen Graefe <jg72@gmx.de>
pkgname=colormake
pkgver=0.9
pkgrel=1
pkgdesc="A simple wrapper around make to make it's output more readable."
arch=('any')
url="http://bre.klaki.net/programs/colormake/"
license=('GPL2')
depends=('bash' 'perl')
source=("${url}${pkgname}-${pkgver}.tar.gz")
sha256sums=('000c629c84342c1224764e99e97ae9814ec6a7b9be0bc5922f2433db0d09c57e')

prepare() {
	cd $srcdir/$pkgname-$pkgver

	# adjust scripts to colormake.pl path
	sed -i 's#colormake.pl#/usr/share/colormake/colormake.pl#g' \
		colormake{,-short} clmake*
}

package() { 
	cd $srcdir/$pkgname-$pkgver

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

