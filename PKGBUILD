# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

_pkgname=srsly
pkgname=python-${_pkgname}
pkgver=2.5.2
pkgrel=1
pkgdesc='Modern high-performance serialization utilities for Python'
arch=(x86_64 aarch64)
url='https://github.com/explosion/srsly'
license=('MIT')
depends=('cython' 'python-catalogue' 'python-pytz' 'python-numpy' 'python-psutil')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-mock')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/release-v${pkgver}.tar.gz)
b2sums=('aab314200b53af01aee5bce9337b655cd8fa0c5d1038a59b71575c7175da873ac4c9e079d6436314adfb5c471f415d905c2d8f297ed6762bb4bdf7613a56748e')

build() {
	cd "${_pkgname}-release-v${pkgver}"
	python -m build --wheel --no-isolation
}

#check() {
#	cd "${_pkgname}-release-v${pkgver}"
#  python -m installer -d tmp_install dist/*.whl
#  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
#  PYTHONPATH="$PWD/tmp_install/$site_packages" python -m pytest -v --pyargs srsly
#}

package() {
	cd "${_pkgname}-release-v${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
