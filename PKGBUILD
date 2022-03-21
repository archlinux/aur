# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=python-gimmik
pkgver=2.3
pkgrel=1
pkgdesc='Generator of Matrix Multiplication Kernels'
arch=('any')
url="https://github.com/pyfr/gimmik"
license=('BSD')
depends=('python-numpy' 'python-mako')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/gimmik/gimmik-$pkgver.tar.gz")
sha256sums=('c019c85316bcf0d5e84de9b7d10127355dfe8037c0e37f1880a9819ce92b74e1')

build() {
	cd "gimmik-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "gimmik-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/gimmik-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/gimmik-$pkgver.dist-info/AUTHORS" \
		"$pkgdir/usr/share/doc/$pkgname/"
}
