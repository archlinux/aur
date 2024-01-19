# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=swaystatus
pkgver=0.4.3
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
md5sums=('0ceb772c94db862c5d8f0aa3fec67723')

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
