# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Mateusz Loskot <mateusz@loskot.net>
pkgname=colormake-git
pkgver=r33.05688ab
pkgrel=1
pkgdesc="A simple wrapper around make to make it's output more readable"
arch=('i686' 'x86_64')
url="https://github.com/pagekite/Colormake"
license=('GPL')
depends=('perl')
makedepends=('git')
source=("${pkgname}::git+https://github.com/pagekite/Colormake.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $srcdir/$pkgname

	# adjust scripts to colormake.pl path
	sed -i 's#colormake.pl#/usr/share/colormake/colormake.pl#g' \
		colormake{,-short} clmake*
}

package() { 
	cd $srcdir/$pkgname

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
		README.md \
		$pkgdir/usr/share/doc/$pkgname
}



# vim:set ts=2 sw=2 et:
