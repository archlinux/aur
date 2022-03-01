# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jeff Henson <jeff@henson.io>
# Contributor: Giacomo Longo <gabibbo97@gmail.com>

pkgname=python-openshift
pkgver=0.13.1
pkgrel=2
pkgdesc="Python client for the OpenShift API"
arch=('any')
url="https://github.com/openshift/openshift-restclient-python"
license=('APACHE')
depends=(
	'python-jinja'
	'python-kubernetes'
	'python-string-utils'
	'python-ruamel-yaml'
	'python-six'
	'python-requests'
	'python-requests-oauthlib')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6a061cc12247e96147e40d8463c133cb01b915907af10df08d937d27e6a1f283')

build() {
	cd "openshift-restclient-python-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "openshift-restclient-python-$pkgver"
	PYTHONPATH=./ pytest -x -c /dev/null test/unit
}

package() {
	export PYTHONHASHSEED=0
	cd "openshift-restclient-python-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
