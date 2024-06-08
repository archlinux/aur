# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-zimports
pkgver=0.6.1
pkgrel=1
pkgdesc="Python import rewriter"
arch=('any')
url="https://github.com/sqlalchemyorg/zimports"
license=('MIT')
depends=('python>=3.7' 'python-pyflakes' 'python-flake8-import-order' 'python-tomli')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cb9806d5a1d43c1e00018d2f724432dbf33485c160e64e6936676ebd983e88ab')

build() {
	cd "zimports-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "zimports-$pkgver"
	pytest -x
}

package() {
	cd "zimports-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/zimports-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
