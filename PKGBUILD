pkgname=python-pybeam
_name=${pkgname#python-}
pkgver=0.8.1
pkgrel=1
pkgdesc="Python module to parse Erlang BEAM files"
arch=('any')
url="https://github.com/matwey/$_name"
license=('custom:MIT')
depends=('python' 'python-construct')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
#checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('0fc97f6a33d3949baaf7df34ece381a3')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

#check() {
#	cd "$_name-$pkgver"
#	pytest
#}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dp -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dp -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
