# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=axisregistry
pkgname=python-$_pyname
pkgver=0.3.10
pkgrel=1
pkgdesc='easy access to the GF Axis Registry'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(Apache)
depends=(python
         python-protobuf)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(python-fonttools
              python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('b1625078ecf3660fcb097ec6dcb4229ee6b65551668c36fcfa2f2819d9888e0b')

prepare() {
	cd "$_archive"
	sed -i -e '/setuptools_scm/s/>=4,<6.1//' setup.py
}

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	PYTHONPATH=Lib pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
