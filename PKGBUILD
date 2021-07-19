#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=python-optimesh
_name=optimesh
pkgver=0.8.2
pkgrel=2
pkgdesc='Mesh optimization, mesh smoothing.'
url='https://github.com/nschloe/optimesh'
arch=('any')
license=('GPL')
depends=(
	'python'
	'python-meshio'
	'python-meshplex'
	'python-numpy'
	'python-quadpy'
	'python-termplotlib'
	'python-npx'
)
optdepends=('python-matplotlib')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('9682f240b91352bfe9d8e647f7ff1520227a54300bd8d2f95742aa8ccccfd5ea0aba5db9c8e3201516dba9f7fd15ad0b1800952406ae6b664b2d7d888f02197f')

# prepare() {
# 	cd "$srcdir/$_name-$pkgver"
#     dephell deps convert --from pyproject.toml --to setup.py
# }

build() {
	cd "$srcdir/$_name-$pkgver"
	python -c 'from setuptools import setup; setup()' build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -c 'from setuptools import setup; setup()' install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE.txt' -t "$pkgdir/usr/share/licenses/$pkgname"
}
