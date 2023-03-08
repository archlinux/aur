# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-doit
pkgname=python-$_name
pkgver=0.12.5
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
sha256sums=('7ad0718486239161ad027b2b8644fd6ecdb0056ab8b766110ad2bbd87449f9ac')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m doit
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" build/dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
