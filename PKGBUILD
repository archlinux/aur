#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-proto-plus
_name=proto-plus
pkgver=1.19.7
pkgrel=1
pkgdesc='A wrapper around protocol buffers.'
arch=('any')
url="https://github.com/googleapis/proto-plus-python"
license=('Apache')
optdepends=('python-google-api-core: Testing')
makedepends=(
	'python'
	'python-setuptools'
)
depends=("python-protobuf")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('d93b3bf53ac8660c69925cf781b08333a42df3e7b18262c9e2194b3581b99d7429a9e732af0bc9e51c1ffafb0845d57041282b9708ac29963d1e152130f1a4e6')

build() {
	cd "$srcdir/$_name-$pkgver" || exit
	export PYTHONHASHSEED=0
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver" || exit
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
