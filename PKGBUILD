# Maintainer: Zoddo <archlinux+aur@zoddo.fr>

pkgname=ofxstatement-qif
pkgver=0.11.0
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
sha256sums=('3021ec5c267f8c126e572b1b34d581b5defad3efe7d0dea48285e16c1a5fcc2a')

build() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}

	cd ${pkgname}-${pkgver}
	python -m build --wheel --no-isolation
}

package() {
	cd ${pkgname}-${pkgver}
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
