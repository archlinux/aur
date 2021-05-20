pkgname=python-pybeam
_name=${pkgname#python-}
pkgver=0.7
pkgrel=1
pkgdesc="Python module to parse Erlang BEAM files"
arch=('any')
url="https://github.com/matwey/$_name"
license=('custom:MIT')
depends=('python' 'python-construct' 'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('4759e2e15052e1254cddaa0da604c957')

build() {
	cd "$_name-$pkgver"
	python ./setup.py build
}

check() {
	cd "$_name-$pkgver"
	python ./setup.py test
}

package() {
	cd "$_name-$pkgver"
	python ./setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dp -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dp -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
