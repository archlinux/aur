# Maintainer: Philipp A. <flying-sheep@web.de>

_name=leidenalg
pkgname=python-$_name
pkgver=0.12.0
pkgrel=1
pkgdesc='The Leiden algorithm for community detection'
arch=(x86_64)
url="https://github.com/vtraag/$_name"
license=(GPL-3.0-or-later)
depends=(python python-igraph libleidenalg)
makedepends=(cmake python-setuptools python-setuptools-scm python-build python-installer python-wheel)
optdepends=('python-tqdm: Optimizer progress status')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c81a45a2fb874fe71e903d43a869d0efeb7f907af70476c03f6945ef0e8f44c5')

build() {
    cd "$srcdir/$_name-$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
