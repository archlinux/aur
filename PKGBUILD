pkgname=aerospike-client-python
pkgbase='aerospike-client-python'
pkgname=(aerospike-client-python aerospike-client-python2)
_name=aerospike
pkgver=2.2.3
pkgrel=2
pkgdesc="Aerospike Client Library for Python"
license=('apache')
arch=('any')
url="https://www.aerospike.com/docs/client/python"
depends=('openssl' 'aerospike-client-c-libuv')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz
    $pkgbase.patch)
sha512sums=('9ed191d2f7b146c3aa4817ed1314bc1d8e76ae484948724da1d1b020a84f787284dadc1067a58c04f3122ff6d70a06b39596a8c3ca5062ae5aa955013d082942'
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
  depends=('python' 'python-setuptools')
  cd "${srcdir}/aerospike-${pkgver}"
  export DOWNLOAD_C_CLIENT=0
  python setup.py install --root="${pkgdir}" --optimize=1
  rm -r "${pkgdir}/usr/aerospike"
}

package_aerospike-client-python2() {
  depends=('python2' 'python2-setuptools')
  cd "${srcdir}/aerospike-${pkgver}"
  export DOWNLOAD_C_CLIENT=0
  python2 setup.py install --root="${pkgdir}" --optimize=1
  rm -r "${pkgdir}/usr/aerospike"
}
