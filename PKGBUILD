# Maintainer: Philipp A. <flying-sheep@web.de>

_name=louvain
pkgname=python-$_name-igraph
pkgver=0.8.2
pkgrel=1
pkgdesc='Louvain algorithm for community detection (for use with python-igraph)'
arch=(any)
url="https://github.com/vtraag/$_name-igraph"
license=(GPL3)
depends=(python python-igraph)
makedepends=(cmake python-setuptools python-setuptools-scm python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ce040bb0c5e349aead5a1e5e99738dcd9f2d10c22526d0633281b6ae230ee8d4')

build() {
    cd "$srcdir/$_name-$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
