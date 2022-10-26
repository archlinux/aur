# Maintainer: Philipp A. <flying-sheep@web.de>

_name=altgraph
pkgname=python-$_name
pkgver=0.17.3
pkgrel=1
pkgdesc='A graph (network) package for constructing graphs, BFS and DFS traversals, topological sort, shortest paths, etc. with graphviz output.'
arch=(any)
url="https://pypi.python.org/pypi/$_name"
license=(MIT)
depends=(python python-setuptools)  # setuptools for pkg_resources
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ad33358114df7c9416cdb8fa1eaa5852166c505118717021c6a8c7c7abbd03dd')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-altgraph/LICENSE"
}
