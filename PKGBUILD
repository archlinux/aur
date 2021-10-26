#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-proto-plus
_name=proto-plus
pkgver=1.19.6
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
b2sums=('f97aef4958051042dc53195319f63ae658add56c18142cb59dd7afb9117e102d4d9625e449d3e8833aa948168cd9cd835b62e11e58478bb091c6211838f1769b')

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
