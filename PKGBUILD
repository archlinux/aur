# Maintainer: Groctel <aur@taxorubio.com>
pkgname=python-networkx-git
_name=networkx
pkgver=2.3.0
pkgrel=1
pkgdesc="Python package for the creation, manipulation, and study of the structure, dynamics, and functions of complex networks."
arch=('any')
url="https://github.com/networkx/networkx"
license=('BSD')
depends=(
	'python-decorator'
	'python-matplotlib'
	'python-numpy'
	'python-pandas'
	'python-scipy'
)
provides=()
source=("$url/archive/refs/heads/main.zip")
sha512sums=('04ca2a9ac1e484df84a9a77c98c4ac85b984e4a991909e72541bf84138980ab53484ac8d1fa800558dbc29d8203043a2175b7f769f056dcff6e5fe5ca6234944')

build() {
	cd "$srcdir/$_name-main"
	sed -i 's/decorator>=4.4,<5/decorator>=5.0.7/' requirements/default.txt
	python setup.py build
}

package() {
	cd "$srcdir/$_name-main"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

