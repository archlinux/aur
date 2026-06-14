# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Chris Warrick <aur@chriswarrick.com>

_pyname=pyroma
pkgname=python-${_pyname}
pkgver=5.1.0.b.1
_pkgver=${pkgver/.0.b.1/b1}
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
sha256sums=('e9fda3fe05f43d68781f8580d927f49bed0c988551cf56f80b1745f128f78b61')

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
