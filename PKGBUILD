#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=nextmeeting
pkgver=1.4.1
pkgrel=1
pkgdesc="An utility tool to show you next meeting with gcalcli"
arch=('any')
url="https://github.com/chmouel/nextmeeting"
license=('Apache')
depends=('python-dateutil' 'gcalcli')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry-core')
source=("https://github.com/chmouel/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('784d85374b8e218eddd0c54ad6ac5aa81fc1a164e18c18da77e605d81168ac6c')

build() {
	cd "$pkgname-$pkgver" || exit
	rm -vf LICENSE
	python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}-${pkgver}" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
