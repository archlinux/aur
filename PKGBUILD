# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-fpdf2
_name=${pkgname#python-}
pkgver=2.8.7
pkgrel=1
pkgdesc='Simple PDF generation for Python'
arch=(any)
url='https://pyfpdf.github.io/fpdf2/'
license=(LGPL-3.0-only)
conflicts=('python-fpdf')
depends=(python python-pillow python-defusedxml python-fonttools)
optdepends=(
    'python-endesive: signing support'
    'python-uharfbuzz: text shaping support'
    'python-cryptography: encryption support'
)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7060ccee5a9c7ab0a271fb765a36a23639f83ef8996c34e3d46af0a17ede57f9')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
