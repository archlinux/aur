# Maintainer: Christian Schwarz <me@cschwarz.com>
pkgbase=servefile
pkgname=servefile
pkgver=v0.4.3
_commit="6b85d23752c7edce0dc2f4edd5e3ad22d7bbed17"
pkgrel=1
pkgdesc="Serve or receive files from shell via a small HTTP server"
arch=('any')
url="http://seba-geek.de/stuff/servefile/"
license=('GPL3')
depends=('python2')
makedepends=('git' 'bash')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname::git://git.someserver.de/git/servefile/#commit=${_commit}")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	sed -i -e "s~/usr/bin/python~/usr/bin/python2~g" servefile
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -D servefile.1 "$pkgdir/usr/share/man/man1/servefile.1"
}

# vim:set ts=2 sw=2 et:
