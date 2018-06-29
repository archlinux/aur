pkgname=aerospike-client-python
pkgbase='aerospike-client-python'
pkgname=(aerospike-client-python aerospike-client-python2)
_name=aerospike
pkgver=3.3.0
pkgrel=1
pkgdesc="Aerospike Client Library for Python"
license=('apache')
arch=('any')
url="https://www.aerospike.com/docs/client/python"
depends=('openssl' 'aerospike-client-c-libuv>=4.1.10')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz
    $pkgbase.patch)
sha512sums=('65bea1fdb74d3fe6d2564e4b27f2e94df10a1c8d218bb042175bdb662efea1a4e66b9287b40435de0ccf47a360f9a6e37a814fbd711698ec262faf225d78aab5'
            'c30d53471e2fc684b8e4ef5095108e82b60a83f162f19d46cb148f506b20061fa2bfaf07a5112ce4e4c502b705fafaafc9da8cd15befcb615c5b76a04d19bc70')

prepare() {
  cd "${srcdir}/aerospike-${pkgver}"
  patch -Np1 -i "${srcdir}/${pkgbase}.patch"
}

build_aerospike-client-python() {
  export DOWNLOAD_C_CLIENT=0
  cd "${srcdir}/aerospike-${pkgver}"
  python setup.py build
}

build_aerospike-client-python2() {
  export DOWNLOAD_C_CLIENT=0
  cd "${srcdir}/aerospike-${pkgver}"
  python2 setup.py build
}

package_aerospike-client-python() {
  depends=('python' 'python-setuptools' 'openssl' 'aerospike-client-c-libuv')
  cd "${srcdir}/aerospike-${pkgver}"
  export DOWNLOAD_C_CLIENT=0
  python setup.py install --root="${pkgdir}" --optimize=1
  rm -r "${pkgdir}/usr/aerospike"
}

package_aerospike-client-python2() {
  depends=('python2' 'python2-setuptools' 'openssl' 'aerospike-client-c-libuv')
  cd "${srcdir}/aerospike-${pkgver}"
  export DOWNLOAD_C_CLIENT=0
  python2 setup.py install --root="${pkgdir}" --optimize=1
  rm -r "${pkgdir}/usr/aerospike"
}
