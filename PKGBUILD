# Maintainer: Carl George < arch at cgtx dot us >

_name="falcon"
_module="$_name"
#_check=1

pkgname=("python-$_module" "python2-$_module")
pkgver=1.1.0
pkgrel=3
pkgdesc="An unladen web framework for building APIs and app backends."
arch=("i686" "x86_64")
url="https://falconframework.org"
license=("Apache")
makedepends=("cython" "python-setuptools" "cython2" "python2-setuptools")
if [[ -v _check ]]; then
    checkdepends=("python-ddt"
                  "python-pytest"
                  "python-requests"
                  "python-testtools"
                  "python-yaml"
                  "python2-ddt"
                  "python2-pytest"
                  "python2-requests"
                  "python2-testtools"
                  "python2-yaml")
fi
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a68c5685459427cc2129c7b9e3aa19ed5adc73b6adff8ca69fe09f6666885ae7')

build() {
    cd "$_name-$pkgver"
    python setup.py build
    python2 setup.py build
}

check() {
    if [[ -v _check ]]; then
        cd "$_name-$pkgver"
        python setup.py test
        python2 setup.py test
    else
        echo "skipping check()"
    fi
}

package_python-falcon() {
    depends=("python-six>=1.4.0" "python-mimeparse>=1.5.2")
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}

package_python2-falcon() {
    depends=("python2-six>=1.4.0" "python2-mimeparse>=1.5.2")
    cd "$_name-$pkgver"
    python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
    mv "$pkgdir/usr/bin/falcon-bench" "$pkgdir/usr/bin/falcon-bench-python2"
    mv "$pkgdir/usr/bin/falcon-print-routes" "$pkgdir/usr/bin/falcon-print-routes-python2"
}
