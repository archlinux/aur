# Maintainer: Philipp A. <flying-sheep@web.de>

_name=wheel-inspect
pkgname=python-$_name
pkgver=1.7.2
pkgrel=1
pkgdesc='Extract information from wheels'
arch=(any)
url="https://github.com/jwodder/$_name"
license=(MIT)
depends=(python python-attrs python-entry-points-txt python-headerparser python-packaging python-readme-renderer python-wheel-filename)
makedepends=(python-hatchling python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name/-/_}-$pkgver.tar.gz")
sha256sums=('7df5a0223c39ba065a1eef6efa4ea575b825dad7f3399ee02aaaa888f07ca5e1')

build() {
	cd "${_name/-/_}-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name/-/_}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
