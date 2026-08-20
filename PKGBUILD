# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=gflanguages
pkgname=python-$_pyname
epoch=1
pkgver=0.7.10
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
sha256sums=('779b52225261c2527ff25c1895f2e83e0955e7bf9b35e8659e0843c24e27354d')

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
