# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=swaystatus
pkgver=0.15.0
pkgrel=1
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
md5sums=('385f2eca3c3722384c17ae55a1b4cc32')

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
    install -pm644 -Dt "$pkgdir"/usr/share/licenses/"$pkgname" ./LICENSE
    python -m installer --compile-bytecode=1 --destdir="$pkgdir" ./dist/*.whl
}
