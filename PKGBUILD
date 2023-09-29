# Maintainer: Pieter Lenaerts <pieter.aj.lenaerts@gmail.com>
pkgname=smugcli-git
pkgver=v1.0.5.r57.g3a097d4
pkgrel=3
pkgdesc="Command line tool for SmugMug, useful for automatically synchronizing a local folder hierarchy with a SmugMug account."
arch=('any')
url="https://github.com/graveljp/smugcli"
license=('MIT')
depends=('python-bottle' 'python-rauth' 'python-requests' 'python-requests-oauthlib' 'python-hachoir' 'python-six' 'python-jsonpath-ng')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=('smugcli::git+https://github.com/graveljp/smugcli/#branch=master')
md5sums=('SKIP')

build() {
	cd "smugcli"
	python -m build --wheel --no-isolation
}

package() {
	cd "smugcli"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

pkgver() {
	cd "smugcli"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
