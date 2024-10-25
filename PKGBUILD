# Maintainer: Philipp A. <flying-sheep@web.de>
_name=fpdf
pkgname=python-$_name
pkgver=1.7.2
pkgrel=2
pkgdesc='Simple PDF generation for Python'
arch=(any)
url='https://github.com/reingart/pyfpdf'
license=(GPL-3.0)
depends=(python)
makedepends=(python-setuptools pandoc python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('125840783289e7d12552b1e86ab692c37322e7a65b96a99e0ea86cca041b6779')

prepare() {
	cd "$_name-$pkgver"
	sed -i 's/description-file/description_file/g' setup.cfg
	sed -i 's/\[wheel\]/[bdist_wheel]/g' setup.cfg
}

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
