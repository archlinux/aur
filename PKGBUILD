# Maintainer: Groctel <aur@taxorubio.com>

_name=networkx

pkgname=python-networkx-git
pkgver=2.6.2.r2.ge605a13c0
pkgrel=1
pkgdesc="Python package for the creation, manipulation, and study of the structure, dynamics, and functions of complex networks."

arch=('any')
license=('BSD')
url="https://github.com/networkx/networkx"

source=("git+$url#branch=main")
sha512sums=('SKIP')

conflicts=('python-networkx')
provides=("python-networkx=$pkgver")

depends=(
	'python-decorator'
	'python-matplotlib'
	'python-numpy'
	'python-pandas'
	'python-scipy'
)
makedepends=('git')

pkgver ()
{
	cd "$srcdir/$_name"
	git describe --long | sed 's/^networkx-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build ()
{
	cd "$srcdir/$_name"
	python setup.py build
}

package ()
{
	cd "$srcdir/$_name"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
