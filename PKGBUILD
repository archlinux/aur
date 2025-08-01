# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=axisregistry
pkgname=python-$_pyname
pkgver=0.4.16
pkgrel=1
pkgdesc='easy access to the GF Axis Registry'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(Apache-2.0)
depends=(python
         python-protobuf)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(python-fonttools
              python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('7a8870b651524eeb6d3efd0fb0ecb5b9ecc64f534d9709bc66e9d525dd5af73a')

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
