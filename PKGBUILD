# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=kipart
pkgver=1.4.2
pkgrel=1
pkgdesc="Python package for generating multi-unit schematic symbols for KiCad from a CSV file"
url="https://github.com/devbisme/KiPart"
depends=(
	'python'
	'python-affine'
	'python-openpyxl'
	'python-pyparsing'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
)
optdepends=()
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('947ca5cc2c9fcb90e3b63769e0e6603c7a93d26088c30ee3496f4291e01bff7b')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	# https://wiki.archlinux.org/title/Python_package_guidelines
	rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
}
