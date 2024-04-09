# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-juggler
pkgname=python-$_name
pkgver=0.6.14
pkgrel=1
pkgdesc="Juggler communication protocol"
url="https://github.com/hat-open/hat-juggler"
license=('Apache')
arch=('any')
depends=('python-aiohttp' 'python-hat-aio' 'python-hat-json' 'python-hat-util')
makedepends=('python-build' 'python-hat-doit' 'python-installer')
source=("https://github.com/hat-open/hat-juggler/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dea73a69189a85b583263e64e9bf25219b688710b0d0e96b89ea9fd1fca17876')

build() {
    cd "$srcdir/$_name-$pkgver"
    sed -i -e 's/"aiohttp ~=3.8.4"/"aiohttp >=3.8.4"/' pyproject.toml
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
