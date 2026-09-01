# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=gflanguages
pkgname=python-$_pyname
epoch=1
pkgver=0.7.11
pkgrel=1
pkgdesc='API for evaluating language support in the Google Fonts collection'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(Apache-2.0)
depends=(python
         python-gfmetadata)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(python-filelock
              python-pytest
              python-regex
              python-uharfbuzz
              python-youseedee)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('165d1e2d7c1b0308b9fab248a966ef816405c71a41b79c1dd0a638bf15b4fce3')

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
