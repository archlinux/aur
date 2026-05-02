# Maintainer: Zoddo <archlinux+aur@zoddo.fr>

pkgname=ofxstatement-qif
pkgver=0.14.0
pkgrel=1
pkgdesc='A plugin for ofxstatement to convert Quicken Interchange Format (QIF) formatted bank transaction files to OFX format.'
arch=('any')
url="https://github.com/robvadai/ofxstatement-qif"
license=('GPL-3.0-only')
depends=(
	ofxstatement
	python-numpy
	python-quiffen
	python-pydantic
)
makedepends=(
	python-build
	python-installer
	python-wheel
	python-setuptools-scm
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a0bc1133fc89148a9e9c9a6dccee1951b3aeadfa59940c94a86c31b6f8f1a3bb')

build() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}

	cd ${pkgname}-${pkgver}
	python -m build --wheel --no-isolation
}

package() {
	cd ${pkgname}-${pkgver}
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
