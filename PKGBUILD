#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

_name=langcodes
pkgname=python-langcodes
pkgver=3.3.0
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
b2sums=('2aaecc132ff7d58023591b2c8597d554d384b3e7f1f9bdc34998dab543d8eee0f4bffedd7c9a5beecf609d0b4117bb45e44f2eecb78c02dcd021c7b6e7648487'
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
