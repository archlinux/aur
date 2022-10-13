# Maintainer: Philipp A. <flying-sheep@web.de>

_name=leidenalg
pkgname=python-$_name
pkgver=0.9.0
pkgrel=2
pkgdesc='The Leiden algorithm for community detection'
arch=(x86_64)
url="https://github.com/vtraag/$_name"
license=(GPL3)
depends=(python-igraph)
makedepends=(cmake python-setuptools python-setuptools-scm python-build python-installer python-wheel)
optdepends=('tqdm: Optimizer progress status')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4878f85b63c4df5632b2bf646e4f9760898ac1f55160dec26b8709b7bee2783c')

build() {
    cd "$srcdir/$_name-$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
