pkgname=python-bcolz
_pkgname=bcolz
pkgver=1.1.2
pkgrel=1
pkgdesc="columnar and compressed data containers."
arch=('any')
url="https://bcolz.readthedocs.org/"
license=('BSD')
depends=('python' 'python-numpy' 'blosc')
optdepends=('python-numexpr')
makedepends=('python-setuptools' 'cython')
source=("https://github.com/Blosc/bcolz/archive/$pkgver.tar.gz" "fix_version")
sha256sums=('99e86082b21b15c60c6dc2166804ec50b093857df283b09ce3d1117c6d6e65d2'
            '08707674eb0c7cb12d70215408102b588a565d2457351bdfe57e7f56375419c7')

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
