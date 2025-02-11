# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=kipart
pkgver=1.4.1
pkgrel=2
pkgdesc="Python package for generating multi-unit schematic symbols for KiCad from a CSV file"
url="https://github.com/devbisme/KiPart"
depends=(
	'python'
	'python-affine'
	'python-future'
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
sha256sums=('980efdbbcedde6564af0ee1bfb61bc59ff84eb644a8f75b439ca1195ab2210f0')

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
