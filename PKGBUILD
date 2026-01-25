#Maintainer digital mystik <echo ZGlnaXRhbF9teXN0aWtAcHJvdG9ubWFpbC5jaAo= | base64 -d>

_name=backports.shutil_which
pkgname=python-backports.shutil_which
pkgver=3.5.2
pkgrel=2
pkgdesc="Backport of shutil.which from Python 3.3"
arch=('any')
url="https://github.com/minrk/backports.shutil_which"
license=("GPL3")
depends=('python' 'python-backports')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/minrk/$_name/archive/refs/tags/$pkgver.tar.gz")

b2sums=('b78e3ddef7028dcec1f162157c021509582b2a5b8a828a9935349432cca72a2a07e123d907ab99a9c608b126d6dabae4e74adc8e62960e506de7bfb0dfeb2fd9')

prepare() {
    cd "$srcdir/$_name-$pkgver"
    rm -f backports/__init__.py
}

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
