# Maintainer: Leo <i@hardrain980.com>
_pkgname=google_re2
pkgname=python-re2
pkgver=1.1.20250805
pkgrel=1
pkgdesc="RE2 Python bindings"
arch=('any')
url="https://github.com/google/re2"
license=('BSD')
depends=('re2>=1:20240501-1')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'pybind11' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('c55d9f7c92a814eb53918a7b38e5ba5eaa1c99548321acb826da9532781af5b5')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	:
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	find $pkgdir -type f -exec chmod 644 {} \;
	find $pkgdir -type d -exec chmod 755 {} \;
}
