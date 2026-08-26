# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: alejandrogomez <alejandroogomez@gmail.com>

pkgname=ydiff
pkgver=1.5
pkgrel=1
pkgdesc="Colored, incremental, side-by-side diff viewer"
arch=('any')
url="http://pypi.python.org/pypi/ydiff/"
license=('BSD-3-Clause')
depends=('python')
makedepends=(python-setuptools python-build python-installer python-wheel)
optdepends=("patchutils: uses filterdiff for context diffs")
conflicts=('cdiff')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/ymattw/${pkgname}/archive/refs/tags/${pkgver}.tar.gz)
b2sums=('86e89b7b8edf81b7ec7e132c1e46ea185beb6c1e89977cb86d89898d6aad6368624f64a36d86e70f802d20ed7ca0ce2d49a1f548b184e681e996c78b0f77d93f')


build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
