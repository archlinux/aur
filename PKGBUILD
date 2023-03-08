# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-juggler
pkgname=python-$_name
pkgver=0.6.10
pkgrel=1
pkgdesc="Juggler communication protocol"
url="https://github.com/hat-open/hat-juggler"
license=('Apache')
arch=('any')
depends=('python-aiohttp' 'python-hat-aio' 'python-hat-json' 'python-hat-util')
makedepends=('python-hat-doit' 'python-installer')
source=("https://github.com/hat-open/hat-juggler/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('179e8f7664898860c5cc127467e53e9fea103fdf410ae7f6e449b763f72784d6')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m doit build_py
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" build/py/dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
