# Maintainer: jakob <grandchild@gmx.net>
# Contributor: Christian Schwarz <me@cschwarz.com>

pkgname=servefile
pkgver=0.4.4
_commit="a0b8ae49329cd992fdd1adad159c7d252ea579d3"
pkgrel=1
pkgdesc="Serve or receive files from shell via a small HTTP server"
arch=('any')
url="http://seba-geek.de/stuff/servefile/"
license=('GPL3')
depends=('python2')
makedepends=('git' 'bash')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname-$pkgver.tar.gz::https://git.someserver.de/seba/servefile/archive/${_commit}.tar.gz")
sha256sums=('c574185292f604f54110f65dabda7c8b1b6f3118dff1dfa51d9dfda6843f6d2d')

prepare() {
	cd "$srcdir/$pkgname"
	sed -i -e "s~/usr/bin/python~/usr/bin/python2~g" servefile
}

package() {
	cd "$srcdir/$pkgname"
	python2 setup.py install --root="$pkgdir/" --optimize=1
	install -D servefile.1 "$pkgdir/usr/share/man/man1/servefile.1"
}
