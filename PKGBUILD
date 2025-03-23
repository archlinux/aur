# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-util
pkgname=python-$_name
pkgver=0.6.19
pkgrel=1
pkgdesc="Hat utility library"
url="https://github.com/hat-open/hat-util"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-hat-doit' 'python-installer')
source=("https://github.com/hat-open/hat-util/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1d955d6b5f437cc9511d9382ac1f58f81ca041babc6c64b8928c9f89f17466e9')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
