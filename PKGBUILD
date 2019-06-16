# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Carl George < arch at cgtx dot us >

_name="falcon"
_module="$_name"
#_check=1

pkgname=("python-$_module" "python2-$_module")
pkgver=2.0.0
pkgrel=1
pkgdesc="An unladen web framework for building APIs and app backends."
arch=("i686" "x86_64")
url="https://falconframework.org"
license=("Apache")
makedepends=("cython" "python-setuptools" "cython2" "python2-setuptools")
if [[ -v _check ]]; then
    checkdepends=("python-pytest>=3.0.1"
                  "python-jsonschema"
                  "python-msgpack"
                  "python-requests"
                  "python-six>=1.4.0"
                  "python-testtools"
                  "python-yaml"
                  "python2-pytest>=3.0.1"
                  "python2-jsonschema"
                  "python2-msgpack"
                  "python2-requests"
                  "python2-six>=1.4.0"
                  "python2-testtools"
                  "python2-yaml")
fi
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('eea593cf466b9c126ce667f6d30503624ef24459f118c75594a69353b6c3d5fc')

build() {
    cd "$_name-$pkgver"
    python setup.py build
    python2 setup.py build
}

check() {
    if [[ -v _check ]]; then
        cd "$_name-$pkgver"
        pytest tests
        pytest2 tests
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
