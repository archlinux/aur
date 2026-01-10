pkgname='python-redfish'
_name=${pkgname#python-}

# Maintainer: Luiz Amaral <email at luiz dot eng dot br>
pkgver=3.3.4
pkgrel=1
pkgdesc='Redfish Python Library'
arch=('any')
license=('BSD-3-Clause')
url='https://pypi.python.org/pypi/redfish'

depends=('python' 'python-requests' 'python-six' 'python-jsonpointer' 'python-requests-toolbelt' 'python-jsonpatch' 'python-jsonpath-rw' 'python-requests-unixsocket')
provides=('python-redfish')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('77257477a8bc3880ae740be5ded6bc0a6803e0c1c9f71289051be1d5ff2ed0e2')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
