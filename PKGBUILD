# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=axisregistry
pkgname=python-$_pyname
pkgver=0.2.0
pkgrel=2
pkgdesc='easy access to the GF Axis Registry'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(Apache)
depends=(python
         python-protobuf)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('561e4b81cc4703afaf4d3cb99771728f1b4b567af2766d008c2b6dbe077efb0d')

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
