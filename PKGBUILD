# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-util
pkgname=python-$_name
pkgver=0.6.8
pkgrel=1
pkgdesc="Hat utility library"
url="https://github.com/hat-open/hat-util"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-hat-doit' 'python-installer')
source=("https://github.com/hat-open/hat-util/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7dd6717cfb0e817abd02954cf2249bdeec2dc3d45e20047155a3d38ffd66ba43')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m doit build_py
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" build/py/dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
