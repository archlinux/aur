# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=swaystatus
pkgver=0.6.3
pkgrel=1
pkgdesc="Generate a status line for swaybar"
arch=('any')
url="https://git.sr.ht/~jmcantrell/$pkgname"
license=('MIT')
depends=('python')
optdepends=()
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
checkdepends=('python-pytest' 'python-pytest-cov')
provides=()
conflicts=()
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz")
md5sums=('e5bd8e1310c180595ad819cba87c8eb0')

check() {
    cd "$srcdir/${pkgname#python-}-$pkgver" || return
    PYTHONPATH=$PWD/src pytest --no-cov
}

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver" || return
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver" || return
    python -m installer --compile-bytecode=1 --destdir="$pkgdir" dist/*.whl
}
