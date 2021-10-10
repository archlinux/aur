#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

_name=langcodes
pkgname=python-langcodes
pkgver=3.2.1
pkgrel=1
pkgdesc='A toolkit for working with and comparing the standardized codes for languages'
arch=('any')
url="https://github.com/LuminosoInsight/langcodes"
license=('Apache')
makedepends=(
	'python'
	'python-setuptools'
)
source=(
	"https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	"https://raw.githubusercontent.com/LuminosoInsight/langcodes/master/LICENSE.txt"
)
b2sums=('2b82562a7f55e7bfb2d52203a46ee6dd12cd91ee4527268583f8da6b8c3c589ed17239bb4723e1a1d8604af766cf2de6997eae9c4f29333bf57bdc11d9a0229f'
	'afaae2fb675c7a953af2d251e57efa75ebe6278f5858c9f802bdec25490f589ba6f85df8d73377f302a8c6120314a479e97ce557315b9352c4d293fe84ba5435')

build() {
	cd "$srcdir/$_name-$pkgver" || exit
	export PYTHONHASHSEED=0
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver" || exit
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 "$srcdir/LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
