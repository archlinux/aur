# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=gflanguages
pkgname=python-$_pyname
pkgver=0.8.9
pkgrel=1
pkgdesc='API for evaluating language support in the Google Fonts collection'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(Apache)
depends=(python
         python-protobuf)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(python-pytest
              python-uharfbuzz
              python-youseedee)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('c23704583787c2b530a59a2c79b36a2f6eca7acb8a0ab67e56712d1137a66679')

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
