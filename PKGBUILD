# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: giniu <gginiu@gmail.com>

pkgbase=python-ipdb
pkgname=(python-ipdb python2-ipdb)
pkgver=0.8
pkgrel=2
pkgdesc="IPython-enabled pdb"
url="http://pypi.python.org/pypi/ipdb"
makedepends=('python-setuptools' 'python2-setuptools' 'ipython' 'ipython2')
arch=("any")
license=("GPL")
source=("https://pypi.python.org/packages/source/i/ipdb/ipdb-${pkgver}.zip")
md5sums=("96dca0712efa01aa5eaf6b22071dd3ed")

prepare() {
  cp -a ipdb-${pkgver}{,-py2}
}

package_python-ipdb() {
  depends=("ipython")

  cd "${srcdir}/ipdb-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"

  ln -s ipdb3 "$pkgdir/usr/bin/ipdb"
}

package_python2-ipdb() {
  depends=("ipython2")

  cd "${srcdir}/ipdb-${pkgver}-py2"
  python2 setup.py install -O1 --root="${pkgdir}"

  mv "$pkgdir/usr/bin/ipdb"{,2}
}
