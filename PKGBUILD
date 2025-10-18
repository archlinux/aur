# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=swaystatus
pkgver=0.10.3
pkgrel=1
pkgdesc="Generate a status line for swaybar"
arch=('any')
url="https://github.com/jmcantrell/$pkgname"
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-uv-build')
checkdepends=('python-pytest')
provides=()
conflicts=()
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz")
md5sums=('65ef5c4336016b858b8f73adf72bf5e0')

check() {
    cd "$srcdir/${pkgname#python-}-$pkgver" || return
    PYTHONPATH=$PWD/src pytest
}

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver" || return
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver" || return
    install -pm644 -Dt "$pkgdir"/usr/share/licenses/"$pkgname" ./LICENSE
    python -m installer --compile-bytecode=1 --destdir="$pkgdir" dist/*.whl
}
