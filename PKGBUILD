#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=python-optimesh
_name=optimesh
pkgver=0.8.3
pkgrel=2
pkgdesc='Mesh optimization, mesh smoothing.'
url="https://github.com/nschloe/$_name"
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
b2sums=('9c20c3425e84a0ee0cb2ce56a1b9ff1af7bc5cde3878d3c33eaf219008fe9d8d45f3b99f97635d09480cea3e956fa6c8b4f045a4006a62f25e043ada3089bb77')

export PYTHONPYCACHEPREFIX="${BUILDDIR}/${pkgname}/.cache/cpython/"

build() {
	cd "$srcdir/$_name-$pkgver"
	export PYTHONHASHSEED=0
	python -c 'from setuptools import setup; setup()' build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -c 'from setuptools import setup; setup()' install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE.txt' -t "$pkgdir/usr/share/licenses/$pkgname"
}
