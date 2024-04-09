# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-doit
pkgname=python-$_name
pkgver=0.15.13
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
sha256sums=('121e316d8c8b096aab7bc5e8c2eb5babfbf8e66acd8fd2cb52a93bfa1216f400')

build() {
    cd "$srcdir/$_name-$pkgver"
    sed -i -e 's/"pdoc >=14.2.0"/"pdoc >=14.1.0"/' pyproject.toml
    sed -i -e 's/"watchdog >=4.0.0"/"watchdog >=2.3.0"/' pyproject.toml
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
