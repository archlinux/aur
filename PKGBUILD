# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-doit
pkgname=python-$_name
pkgver=0.11.10
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
sha256sums=('1f84bb9c4000cfce20af215632dcc03e7473faba238a70572387bc8b072f7ce2')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m doit
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" build/dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
