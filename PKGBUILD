# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Daniel Milde <daniel@milde.cz>
pkgname=aerospike-client-python
pkgbase='aerospike-client-python'
pkgname=(aerospike-client-python)
_name=aerospike
pkgver=16.0.1
pkgrel=1
pkgdesc="Aerospike Client Library for Python"
license=('Apache-2.0')
arch=('any')
url="https://www.aerospike.com/docs/client/python"
depends=('python' 'python-setuptools' 'openssl' 'aerospike-client-c-libuv')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz
    $pkgbase.patch)
sha512sums=('3ae3b323a432548939805aad7784b370297334d6cc6730dd82bd9a124baca65a25c6bb94c36c70a0ac529f6bc3ce30ec935b9332b11f51f8da3a0db8d0de42d7'
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
