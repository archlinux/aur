# Maintainer: hexchain <i at hexchain dot org>

_pypiname=pyperformance
pkgname=python-$_pypiname
pkgver=1.0.1
pkgrel=1
pkgdesc='Python Performance Benchmark Suite'
url="https://github.com/python/pyperformance"
depends=('python-pyperf' 'python-six')
makedepends=('python-pip')
checkdepends=('python-tox')
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pypiname:0:1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('6522d28a539ccd28a3da51e8ec1f5891dd05e917d16d7d1d7f1bccdc4b8922ce')

build() {
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py build
}

check() {
    cd "$srcdir/$_pypiname-$pkgver"
    tox -s true
}

package() {
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
    install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
