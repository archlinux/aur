#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-dmsh
_name=dmsh
pkgver=0.2.18
pkgrel=1
pkgdesc='Simple mesh generator inspired by distmesh.'
arch=('x86_64')
url="https://github.com/nschloe/dmsh"
license=('GPL')
optdepends=('python-matplotlib')
makedepends=(
	'python'
	'python-setuptools'
)
depends=(
	'python-meshplex'
	'python-npx'
	'python-numpy'
	'python-scipy'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('6935baef42724ca93325f6433f9bc0fde7c79fbed59633045f51c1504552c62c9ae84af791e729e69e894e8068990be135f5a6d8b1af14006a7578d1342e75d0')

build() {
	cd "$srcdir/$_name-$pkgver" || exit
	export PYTHONHASHSEED=0
	python -c "from setuptools import setup; setup()" build
}

package() {
	cd "$srcdir/$_name-$pkgver" || exit
	python -c "from setuptools import setup; setup();" install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
