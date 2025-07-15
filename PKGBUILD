# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Chris Warrick <aur@chriswarrick.com>

_pyname=pyroma
pkgname=python-${_pyname}
pkgver=5.0
pkgrel=1
pkgdesc="Test your project's packaging friendliness"
arch=('any')
url="https://github.com/regebro/${_pyname}"
license=('MIT')
depends=('python-setuptools' 'python-build')
makedepends=('python-installer' 'python-wheel')
#checkdepends=('python-pytest' 'python-docutils' 'python-requests' 'python-pygments' 'python-trove-classifiers' 'python-packaging')
options=(!emptydirs)
source=("${_pyname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c7686fe93a58fe660c96f407be2c50c61f4aa9abe5e55d1057b7d99d7829984b')

_srcdir="${_pyname}-${pkgver}"

build() {
	cd "$_srcdir"
	python -m build --wheel --no-isolation
}

#check() {
#	cd "$_srcdir"
#	pytest
#}

package() {
	depends+=('python-docutils' 'python-requests' 'python-pygments' 'python-trove-classifiers' 'python-packaging')

	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
