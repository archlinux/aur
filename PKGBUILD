# Maintainer: Phil Schaf <flying-sheep@web.de>
_name=ndjson-testrunner
pkgname=python-$_name
pkgver=1.1.3
pkgrel=1
pkgdesc='A python unittest test runner that outputs newline delimited JSON results'
arch=('any')
url="https://github.com/flying-sheep/$_name"
license=(GPL-3.0-or-later)
depends=(python)
makedepends=(python-hatchling python-hatch-vcs python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name/-/_}-$pkgver.tar.gz")
sha256sums=('58f6cdceac7345e3fbce809c40079323d99033be0e5dce79f2f60de0f7d35858')

build() {
	cd "${_name/-/_}-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name/-/_}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
