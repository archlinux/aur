#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=python-meshplex
_name=${pkgname#python-}
pkgver=0.16.4
pkgrel=1
pkgdesc='Compute interesting points, areas, and volumes in triangular and tetrahedral meshes.'
url='https://github.com/nschloe/meshplex'
arch=('any')
license=('GPL')
makedepends=(
	'python'
	'python-setuptools'
	'python-dephell'
)
depends=(
	'python-meshio'
	'python-numpy'
	'python-npx'
)
optdepends=(
	'python-matplotlib'
	'vtk'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('ac1c981fcf60ff353e3cf504f2922ef16090501679a02107141c299358dd52f3f0af58b48da155e6e143fd3e9875c41d4a1b235df90be62fc18b84c1e76a341a')

prepare() {
	cd "$srcdir/$_name-$pkgver" || exit
	dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "$srcdir/$_name-$pkgver" || exit
	export PYTHONHASHSEED=0
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver" || exit
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
