# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-doit
pkgname=python-$_name
pkgver=0.16.2
pkgrel=1
pkgdesc="Hat build utility functions"
url="https://github.com/hat-open/hat-doit"
license=('Apache')
arch=('any')
depends=('python-doit' 'flake8' 'python-sphinx-furo' 'mkwhl'
         'python-packaging' 'python-pdoc' 'python-pytest'
         'python-pytest-asyncio' 'python-pytest-cov' 'python-pytest-timeout'
         'python-sphinx' 'python-watchdog')
makedepends=('python-build' 'python-installer')
source=("https://github.com/hat-open/hat-doit/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6935b9bbb72c23cec08b05a699f49fc32fdd2a4c9f1ccb1c251420b1b151ac8d')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
