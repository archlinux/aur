# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=axisregistry
pkgname=python-$_pyname
pkgver=0.4.19
pkgrel=1
pkgdesc='easy access to the GF Axis Registry'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(Apache-2.0)
depends=(python
         python-gfmetadata)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(python-fonttools
              python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('db902e5af20892da439af35e2602040eed7ee2853b141d2795affbd9f6d17494')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	export PYTHONPATH=Lib
	export PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python
	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
