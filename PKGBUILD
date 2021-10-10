#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-proto-plus
_name=proto-plus
pkgver=1.19.4
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
b2sums=('698539bb900e2e51d978410d1cb181060b0b44fb49970407a2d5028e9689d6396d8dae4ad4cc697920b7939a2d0ba9b9b6f051c504ce2eaca287da5b37dd065f')

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
