# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-pytest-split
pkgver=0.10.0
pkgrel=1
pkgdesc="Pytest plugin which splits the test suite based on test execution time."
arch=('any')
url="https://github.com/jerry-git/pytest-split"
license=('MIT')
depends=('python-pytest')
makedepends=('python-poetry-core')

_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('adf80ba9fef7be89500d571e705b4f963dfa05038edf35e4925817e6b34ea66f')

build() {
    cd "$srcdir/pytest_split-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/pytest_split-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
