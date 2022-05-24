#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

_name=asks
pkgname=python-asks
pkgver=3.0.0
pkgrel=1
pkgdesc="Async requests-like httplib for python."
arch=('any')
url="https://github.com/theelous3/asks"
license=('MIT')
depends=(
	'python-async_generator'
	'python-h11'
	'python-anyio')
optdepends=(
	'python-trio: test use'
	'python-curio: test use'
	'python-pytest: test use'
	'python-overly: test use')
makedepends=(
	'python-wheel'
	'python-build'
	'python-installer'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('34202ba49b23dec5161f8b39a2dc970b4caf83b31aeaa5b9e93f57b05ec48a47a953395fbb79c1e114fef17ef58ee184c0240292b0209de0f70e39014ebc21ad')

build() {
	cd "$srcdir/$_name-$pkgver" || exit

	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver" || exit

	python -m installer --destdir="$pkgdir" dist/*.whl

	# install -Dm644 LICENCE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
