# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-doit
pkgname=python-$_name
pkgver=0.16.1
pkgrel=1
pkgdesc="Hat build utility functions"
url="https://github.com/hat-open/hat-doit"
license=('Apache')
arch=('any')
depends=('python-doit' 'flake8' 'python-sphinx-furo' 'mkwhl'
         'python-packaging' 'python-pdoc' 'python-pytest'
         'python-pytest-asyncio' 'python-pytest-cov' 'python-pytest-timeout'
         'python-sphinx' 'python-tomli' 'python-watchdog')
makedepends=('python-build' 'python-installer')
source=("https://github.com/hat-open/hat-doit/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2591e973d87359fc90229c33c010aa4b9c0edd4bbd49c628dae22bb61ab24f9e')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
