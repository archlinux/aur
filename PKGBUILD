# Maintainer: Philipp A. <flying-sheep@web.de>

_name=itertools-len
pkgname=python-$_name
pkgver=1.3
pkgrel=1
pkgdesc='Wrapper around the stdlib’ itertools with len() support'
arch=('any')
url="https://github.com/flying-sheep/$_name"
license=('GPL-3.0-or-later')
depends=(python)
checkdepends=(python-pytest)
makedepends=(python-hatchling python-hatch-vcs python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name/-/_}-$pkgver.tar.gz")
sha256sums=('149048397bf26ffecf89c26b7809359d76ddbfd01a753f71fc15da074afa0b40')

build() {
	cd "${_name/-/_}-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "${_name/-/_}-$pkgver"
	PYTHONPATH=src pytest --color=yes -v
}

package() {
	cd "${_name/-/_}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
