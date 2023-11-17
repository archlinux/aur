# Maintainer: Sir-Photch < sir-photch ate posteo dote me >

pkgname=python-linkedin-messaging
_pkgname=${pkgname#python-}-api
pkgver=0.6.0
pkgrel=1
pkgdesc='An unofficial API for interacting with LinkedIn Messaging'
arch=(any)
url='https://github.com/beeper/linkedin-messaging-api'
license=(Apache)
provides=('linkedin_messaging')
depends=(
	'python'
	'python-aiohttp'
	'python-beautifulsoup4'
	'python-dataclasses-json'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-flit-core'
	'python-pytest-runner'
)

source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/beeper/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('72ac0fd9d1b392eb2a84369bbe92b83ee531e41fb5f66a6b6724fe33972a43e1')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	# these sourcefiles and test-files are missing from the pypi tarball and are required for tests to run
	cd "${srcdir}/${_pkgname}-${pkgver}"	
	nosetests
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}


