pkgname=python-bcolz
_pkgname=bcolz
pkgver=1.2.0
pkgrel=1
pkgdesc="columnar and compressed data containers."
arch=('any')
url="https://bcolz.readthedocs.org/"
license=('BSD')
depends=('python' 'python-numpy' 'blosc')
optdepends=('python-numexpr')
makedepends=('python-setuptools' 'cython')
source=("https://github.com/Blosc/bcolz/archive/$pkgver.tar.gz" "fix_version")
sha256sums=('f60e77b5ee5c5e328eeefdea51b2a9159fb372bd3170f5253b4805e8e06d229f'
            '689d566d0aa28ab78fa660f1323204dbb145cd32a98fab907839cde98894cb84')

build() {
    cd "$_pkgname-$pkgver"
    patch -Np1 -i ../fix_version setup.py
    echo "version='$pkgver'" > bcolz/version.py
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --blosc=/usr
}


# vim:ts=2:sw=2:et:
