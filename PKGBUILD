# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Chris Warrick <aur@chriswarrick.com>

_pyname=pyroma
pkgname=python-${_pyname}
pkgver=4.3.1
pkgrel=1
pkgdesc="Test your project's packaging friendliness"
arch=('any')
url="https://github.com/regebro/${_pyname}"
license=('MIT')
depends=('python' 'python-docutils' 'python-requests' 'python-pygments'
	'python-trove-classifiers' 'python-setuptools' 'python-build' 'python-packaging')
makedepends=('python-installer' 'python-wheel')
options=(!emptydirs)
source=("${_pyname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('499f0dce1184de737dc96b6f8102cb34dbdeef261cbc5f063057da4e068bf981')

_srcdir="${_pyname}-${pkgver}"

build() {
	cd "$_srcdir"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
