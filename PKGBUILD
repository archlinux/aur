# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=swaystatus
pkgver=0.4.0
pkgrel=1
pkgdesc="Generate a status line for swaybar"
arch=('any')
url="https://git.sr.ht/~jmcantrell/$pkgname"
license=('MIT')
depends=('python' 'python-toml')
optdepends=()
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
checkdepends=('python-pytest' 'python-pytest-cov')
provides=()
conflicts=()
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz")
md5sums=('5100ed5fd89cd8b85e6f10d447638a2a')

check() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    PYTHONPATH=$PWD/src pytest --no-cov
}

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --compile-bytecode=1 --destdir="$pkgdir" dist/*.whl
}
