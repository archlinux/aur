# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-doit
pkgname=python-$_name
pkgver=0.15.7
pkgrel=1
pkgdesc="Hat build utility functions"
url="https://github.com/hat-open/hat-doit"
license=('Apache')
arch=('any')
depends=('python-build' 'python-doit' 'flake8' 'python-sphinx-furo'
         'python-packaging' 'python-pdoc' 'python-pytest'
         'python-pytest-asyncio' 'python-pytest-cov' 'python-pytest-timeout'
         'python-setuptools' 'python-sphinx' 'python-wheel')
makedepends=('python-installer')
source=("https://github.com/hat-open/hat-doit/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7f8e49f14ed0ebe2628bdba7e4f6917bc8078a540edd1cedcab2c48ca4d41eec')

build() {
    cd "$srcdir/$_name-$pkgver"
    sed -i -e 's/"pdoc >=14.2.0"/"pdoc >=14.1.0"/' pyproject.toml
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
