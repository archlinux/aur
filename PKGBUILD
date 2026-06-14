# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Chris Warrick <aur@chriswarrick.com>

_pyname=pyroma
pkgname=python-${_pyname}
pkgver=5.1.0.b.2
_pkgver=${pkgver/.0.b.2/b2}
pkgrel=1
pkgdesc="Test your project's packaging friendliness"
arch=('any')
url="https://github.com/regebro/${_pyname}"
license=('MIT')
depends=('python-setuptools' 'python-build')
makedepends=('python-installer' 'python-wheel')
#checkdepends=('python-pytest' 'python-docutils' 'python-requests' 'python-pygments' 'python-trove-classifiers' 'python-packaging')
options=(!emptydirs)
source=("${_pyname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('54d7a38d257b89264e20f014fbff8d92527f549da6e608acdfb4c66be2f8b884')

_srcdir="${_pyname}-${_pkgver}"

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
