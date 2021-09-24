# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=python-spython
pkgver=0.1.16
pkgrel=1
pkgdesc="CLI tool for working with Singularity Python"
arch=('any')
url="https://singularityhub.github.io/singularity-cli/"
license=('MPL2')
depends=('python-requests' 'python-semver')
optdepends=('singularity-container: to use and manipulate Singularity Containers')
makedepends=('python-setuptools' 'python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/spython/spython-$pkgver.tar.gz")
sha256sums=('0d3d9a2f77da48b5e635af54d26de45a908d8eba2cb184b7791e928dd3b00f45')

# prepare() {
# 	cd "spython-$pkgver"
# 	echo 'prune spython/tests' >> MANIFEST.in
# }

build() {
	cd "spython-$pkgver"
	python setup.py build
}

check() {
	cd "spython-$pkgver"
	python setup.py pytest
}

package() {
	cd "spython-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
