# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>
# Contributor: Daniel Milde <daniel@milde.cz>

pkgname=python2-pysqlite
_pkgname="${pkgname#python2-}"
pkgver=2.8.3
pkgrel=1
pkgdesc="A Python DB-API 2.0 interface for the SQLite embedded relational database engine"
license=('custom')
arch=('x86_64')
url="https://pypi.python.org/pypi/pysqlite"
depends=('python2' 'sqlite')
source=("https://pypi.python.org/packages/source/p/pysqlite/pysqlite-${pkgver}.tar.gz")
sha256sums=('17d3335863e8cf8392eea71add33dab3f96d060666fe68ab7382469d307f4490')

prepare() {
  :
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  py2_version="$(python2 -c 'import sys; print "{}.{}".format(sys.version_info.major, sys.version_info.minor)')"
  cd "build/lib.linux-${arch}-${py2_version}/"
  python2 -c "from pysqlite2 import test; test.test()"
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -r "${pkgdir}/usr/pysqlite2-doc"
}
