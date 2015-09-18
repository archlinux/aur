pkgbase=python-pysqlite
pkgname=python2-pysqlite
pkgver=2.8.1
pkgrel=1
pkgdesc="A Python DB-API 2.0 interface for the SQLite embedded relational database engine"
license=('custom')
arch=('any')
url="https://pypi.python.org/pypi/pysqlite"
depends=('python2' 'sqlite')
conflicts=('python-pysqlite<=2.8.1-1')
replaces=('python-pysqlite<=2.8.1-1')
source=(https://pypi.python.org/packages/source/p/pysqlite/pysqlite-${pkgver}.tar.gz
        setup.cfg)
sha256sums=('75cae18f9646f2a6137e1fb5302dba674b6982eeab3a2829377e98b13cfea066'
         '37eeb06fdb89d5dd7674f8f8094614c21468b6b469169b1db5981632aa573dca')

prepare() {
  cp "${srcdir}/setup.cfg" pysqlite-${pkgver}
}

build() {
  cd pysqlite-${pkgver}
  python2 setup.py build
}

check() {
  cd pysqlite-${pkgver}/build/lib.*/
  python2 -c "from pysqlite2 import test; test.test()"
}

package_python2-pysqlite() {
  cd pysqlite-${pkgver}
  python2 setup.py install --root="${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -r "${pkgdir}/usr/pysqlite2-doc"
}
