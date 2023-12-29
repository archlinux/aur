# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-util
pkgname=python-$_name
pkgver=0.6.11
pkgrel=1
pkgdesc="Hat utility library"
url="https://github.com/hat-open/hat-util"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-hat-doit' 'python-installer')
source=("https://github.com/hat-open/hat-util/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d848dfb256c3886d667bcf2d3192887f5ffcca29160f1544e4b61ebbec750e36')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
