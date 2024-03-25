#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=nextmeeting
pkgver=1.3.0
pkgrel=1
pkgdesc="An utility tool to show you next meeting with gcalcli"
arch=('any')
url="https://github.com/chmouel/nextmeeting"
license=('Apache')
depends=('python-dateutil' 'gcalcli')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry-core')
source=("https://github.com/chmouel/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c828c63102571f0a893391775beb5e1451ade6160a31502a8b1ddf66d3aa61dc')

build() {
	cd "$pkgname-$pkgver" || exit
	rm -vf LICENSE
	python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}-${pkgver}" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
