#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=nextmeeting
pkgver=1.1.2
pkgrel=1
pkgdesc="An utility tool to show you next meeting with gcalcli"
arch=('any')
url="https://github.com/chmouel/nextmeeting"
license=('Apache')
depends=('python-dateutil' 'gcalcli')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry-core')
source=("https://github.com/chmouel/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('57eb5e218a143c89bf749d39265a32a4efbb06ce08dae3208cbe2de5db6bb558')

build() {
	cd "$pkgname-$pkgver" || exit
	rm -vf LICENSE
	python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}-${pkgver}" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
