# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Daniel Milde <daniel@milde.cz>
pkgname=aerospike-client-python
pkgbase='aerospike-client-python'
pkgname=(aerospike-client-python)
_name=aerospike
pkgver=17.0.0
pkgrel=1
pkgdesc="Aerospike Client Library for Python"
license=('Apache-2.0')
arch=('any')
url="https://aerospike.com/docs/develop/client/python/"
depends=('python' 'python-setuptools' 'openssl' 'aerospike-client-c-libuv')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz
    $pkgbase.patch)
sha512sums=('61f4cf101ec331077220b843476a8d28305db0d0b70340975319a8bb7effbdd275bf64e6db5e7c93343c68b197fe4ffc71c2f4dce3468dd340b0b78e5309e98c'
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
