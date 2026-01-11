# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=pypika
pkgname="python-${_pkgname}"
pkgver=0.49.0
pkgrel=2
pkgdesc="A SQL query builder API for Python"
arch=("any")
url="https://github.com/kayak/${_pkgname}"
license=('Apache-2.0')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    "support-python-3.14.patch")
b2sums=('f5eba14961a9bde1d5708e3ca0ee08750f9fea124bcb2e841e11b0820bb1169cbb08b4f2e27d07d289505655043fcfc0eedafb30b7e8876014a4794b309f1510'
        '0cf2c439bca628071b86b71d913a0e6affc7dadb788684ff52f5cdca9b612a3f4c8d7a8653c273364f359f871638eb7bfd84f79f7a6c6adfd2e619ccf27c50a9')

prepare() {
    cd "${_pkgname}-${pkgver}"
    patch -Np1 < ../support-python-3.14.patch
}

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
