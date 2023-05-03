# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-util
pkgname=python-$_name
pkgver=0.6.9
pkgrel=1
pkgdesc="Hat utility library"
url="https://github.com/hat-open/hat-util"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-hat-doit' 'python-installer')
source=("https://github.com/hat-open/hat-util/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ee19f44ace8b321f36ec36321725975584c636cfb9439973e6c610183ded4142')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m doit build_py
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" build/py/dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
