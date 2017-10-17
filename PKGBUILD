# Maintainer: Matthew Treinish <mtreinish@kortar.org>
pkgbase=python-stestr
pkgname=('python-stestr' 'python2-stestr')
pkgver=1.1.0
pkgrel=1
pkgdesc="A parallel Python test runner built around subunit"
arch=('any')
url=https://github.com/mtreinish/stestr
license=('Apache')
source=( https://pypi.python.org/packages/4f/80/302ab57589381266b60dc2a515fc6e1aa880601b4e16e8b0ed17fccd89f2/stestr-1.1.0.tar.gz )
md5sums=('22e660eba860eddd8a622b093af3a231')
depends=('python' 'python-subunit' 'python-testtools' 'python-six' 'python-pbr' 'python-fixtures' 'python-yaml' 'python2' 'python2-subunit' 'python2-testtools' 'python2-six' 'python2-pbr' 'python2-fixtures' 'python2-yaml')
makedepends=('python-setuptools' 'python2-setuptools' 'python-sphinx' 'python-subunit2sql')

package_python-stestr() {
  depends=('python' 'python-subunit' 'python-testtools' 'python-six' 'python-pbr' 'python-fixtures' 'python-yaml')
  optdepends=('python-subunit2sql: sql results repository')

  cd $srcdir/stestr-$pkgver
  python setup.py install --root=$pkgdir
  sed -i "s/'trunk'/'${pkgver}'/g" doc/source/conf.py
  echo "sys.path.insert(0, os.path.abspath('$srcdir/stestr-$pkgver'))" >> doc/source/conf.py
  rm doc/build/man/stestr.1.gz
  sphinx-build -b man doc/source doc/build/man
  gzip doc/build/man/stestr.1
  mkdir -p "${pkgdir}/usr/share/man/man1"
  install -m 755 doc/build/man/stestr.1.gz "${pkgdir}/usr/share/man/man1/stestr.1.gz"
}

package_python2-stestr() {
  depends=('python2' 'python2-subunit' 'python2-testtools' 'python2-six' 'python2-pbr' 'python2-fixtures' 'python2-yaml')
  optdepends=('python2-subunit2sql: sql results repository')

  cd $srcdir/stestr-$pkgver
  python2 setup.py install --root=$pkgdir
  sed -i "s/'trunk'/'${pkgver}'/g" doc/source/conf.py
  echo "sys.path.insert(0, os.path.abspath('$srcdir/stestr-$pkgver'))" >> doc/source/conf.py
  rm doc/build/man/stestr.1.gz
  sphinx-build -b man doc/source doc/build/man
  gzip doc/build/man/stestr.1
  mkdir -p "${pkgdir}/usr/share/man/man1"
  install -m 755 doc/build/man/stestr.1.gz "${pkgdir}/usr/share/man/man1/stestr.1.gz"
}
