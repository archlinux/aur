# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Daniel Milde <daniel@milde.cz>
pkgname=aerospike-client-python
pkgbase='aerospike-client-python'
pkgname=(aerospike-client-python)
_name=aerospike
pkgver=15.0.0
pkgrel=1
pkgdesc="Aerospike Client Library for Python"
license=('apache')
arch=('any')
url="https://www.aerospike.com/docs/client/python"
depends=('python' 'python-setuptools' 'openssl' 'aerospike-client-c-libuv')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz
    $pkgbase.patch)
sha512sums=('e4a285fa7123edcbbb93dcf763889f3cd879840675706503f832e83a7897e6bdf735993af825a5eb3bcab07cb3124af05cacf201d7225985c1d8d392ae205479'
            'f635d2b42e6d1144acbc3f26e002f49b8be45a310977e3db537f06ccb21d74c31443f8279b709f57d1425d244aad8c65533a1815bec6d91ff77075b959b915f1')

prepare() {
  cd "${srcdir}/aerospike-${pkgver}"
  patch -Np1 -i "${srcdir}/${pkgbase}.patch"
}

build_aerospike-client-python() {
  export DOWNLOAD_C_CLIENT=0
  cd "${srcdir}/aerospike-${pkgver}"
  python setup.py build
}

package_aerospike-client-python() {
  cd "${srcdir}/aerospike-${pkgver}"
  export DOWNLOAD_C_CLIENT=0
  python setup.py install --root="${pkgdir}" --optimize=1
}
