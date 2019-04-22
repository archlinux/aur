# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Former maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Mateusz Loskot <mateusz@loskot.net>

pkgname=colormake-git
pkgver=0.9.20140503.r19.g93dd19b
pkgrel=1
pkgdesc="Colorize the output of make"
arch=('any')
url="http://bre.klaki.net/programs/colormake/"
license=('GPL2')
depends=('perl' 'bash')
makedepends=('git')
provides=('colormake')
conflicts=('colormake')
source=("git+https://github.com/pagekite/Colormake.git")
sha256sums=('SKIP')


prepare() {
  cd "Colormake"

	# adjust scripts to colormake.pl path
	sed -i 's#colormake.pl#/usr/share/colormake/colormake.pl#g' "colormake"
}

pkgver() {
  cd "Colormake"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "Colormake"

	# executables
  install -dm755 "$pkgdir/usr/bin"
  cp -r {clmake,clmake-short,colormake,colormake-short} "$pkgdir/usr/bin"

	install -Dm755 "colormake.pl" "$pkgdir/usr/share/colormake/colormake.pl"

	# man page
	install -Dm644 "colormake.1" "$pkgdir/usr/share/man/man1/colormake.1"

	# documentation
	install -dm755 "$pkgdir/usr/share/doc/colormake"
	install -m644 \
		AUTHORS \
		BUGS \
		ChangeLog \
		README.md \
		"$pkgdir/usr/share/doc/colormake"
}
