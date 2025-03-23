# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-juggler
pkgname=python-$_name
pkgver=0.7.1
pkgrel=1
pkgdesc="Juggler communication protocol"
url="https://github.com/hat-open/hat-juggler"
license=('Apache')
arch=('any')
depends=('python-aiohttp' 'python-hat-aio' 'python-hat-json' 'python-hat-util')
makedepends=('python-build' 'python-hat-doit' 'python-installer')
source=("https://github.com/hat-open/hat-juggler/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b9466475d72ebcc91992ff7f0fdeead2ec15609f78a5c2147c4c27d9684f9de8')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
