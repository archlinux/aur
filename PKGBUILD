pkgname=python-bcolz
_pkgname=bcolz
pkgver=1.1.1
pkgrel=2
pkgdesc="columnar and compressed data containers."
arch=('any')
url="https://bcolz.readthedocs.org/"
license=('BSD')
depends=('python' 'python-numpy' 'blosc')
optdepends=('python-numexpr')
makedepends=('python-setuptools' 'cython')
source=("https://github.com/Blosc/bcolz/archive/$pkgver.tar.gz" "fix_version")
sha256sums=('1d1acbeb25012d82ee3a81e61243ffd9923e43a18e241b376dfd1d28d189d372'
            '8c4cd8d7c8787c3378fb5c22fe4e1295ff239ee882349f5ab9e572a3ce742342')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    patch -Np1 -i ../fix_version setup.py
    echo "version='$pkgver'" > bcolz/version.py
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --blosc=/usr
}


# vim:ts=2:sw=2:et:
