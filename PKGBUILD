# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-ax-platform
pkgver=0.2.5.1
pkgrel=1
pkgdesc='Adaptive Experimentation Platform'
arch=('any')
url='https://github.com/facebook/ax'
license=('MIT')
depends=(
	'python-botorch'
	'python-jinja'
	'python-pandas'
	'python-scipy'
	'python-scikit-learn'
	'python-plotly'
	'python-typeguard')
makedepends=('python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('17efb87da3ff864d65f861d7f1827c3756dc0c9350e4dc52cce37765c7d3f01e')

build() {
	cd "Ax-$pkgver"
	SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
	cd "Ax-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/ax_platform-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
