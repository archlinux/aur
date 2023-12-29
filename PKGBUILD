# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-juggler
pkgname=python-$_name
pkgver=0.6.12
pkgrel=1
pkgdesc="Juggler communication protocol"
url="https://github.com/hat-open/hat-juggler"
license=('Apache')
arch=('any')
depends=('python-aiohttp' 'python-hat-aio' 'python-hat-json' 'python-hat-util')
makedepends=('python-build' 'python-hat-doit' 'python-installer')
source=("https://github.com/hat-open/hat-juggler/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a06a1a8410f5cc0455596325d43263ebb8c510b320c11441b7ba20ad96726d35')

build() {
    cd "$srcdir/$_name-$pkgver"
    sed -i -e 's/"aiohttp ~= 3.8.4"/"jsonschema >=3.8.4"/' pyproject.toml
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
