# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=swaystatus
pkgver=0.2.6
pkgrel=1
pkgdesc="Generates a status line for swaybar"
arch=('any')
url="https://github.com/jmcantrell/$pkgname"
license=('GPL3')
depends=('python' 'python-schema' 'python-toml')
optdepends=('python-systemd: systemd journal logging')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
checkdepends=('python-pytest' 'python-pytest-cov')
provides=()
conflicts=()
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz")
md5sums=('8be1ce78f682b68b9d7970b2ec7395c0')

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
