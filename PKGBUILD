# Maintainer: Zoddo <archlinux+aur@zoddo.fr>

pkgname=ofxstatement-qif
pkgver=0.6.0
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
sha256sums=('e1bace9ace1d048a4a6a38778406f295e0e1e3ed1ba56a950f4833eb5af5f5b9')

build() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}

	cd ${pkgname}-${pkgver}
	python -m build --wheel --no-isolation
}

package() {
	cd ${pkgname}-${pkgver}
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
