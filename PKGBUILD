pkgname='python-redfish'
_name=${pkgname#python-}

# Maintainer: Luiz Amaral <email at luiz dot eng dot br>
pkgver=3.2.5
pkgrel=1
pkgdesc='Redfish Python Library'
arch=('any')
license=('BSD-3-Clause')
url='https://pypi.python.org/pypi/redfish'

depends=('python' 'python-requests' 'python-six' 'python-jsonpointer' 'python-requests-toolbelt' 'python-jsonpatch' 'python-jsonpath-rw' 'python-requests-unixsocket')
provides=('python-redfish')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('cfe778386b5e408075689236cdcb32b191add69a269e6d3cf64e55624b2970d7')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
