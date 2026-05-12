# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=swaystatus
pkgver=0.16.0
pkgrel=2
pkgdesc="Generate a status line for swaybar"
arch=('any')
url="https://github.com/jmcantrell/$pkgname"
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-uv-build')
checkdepends=()
provides=()
conflicts=()
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz")
md5sums=('546d8d70e098feb8e0e11e59a6a3881c')

check() {
    cd "$srcdir/${pkgname#python-}-$pkgver" || return
    PYTHONPATH=$PWD/src python -m unittest discover -s ./tests "$@"
}

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver" || return
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver" || return
    install -p -m644 -D -t "$pkgdir"/usr/share/licenses/"$pkgname" ./LICENSE
    python -m installer --compile-bytecode=1 --destdir="$pkgdir" ./dist/*.whl
}
