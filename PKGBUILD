# Contributor: Richard PALO <richard.palo@free.fr>
# Contributor: Florian Walch <florian.walch@gmx.at>
# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=('python-relatorio' 'python2-relatorio')
pkgver=0.8.1
pkgrel=1
pkgdesc="A templating library able to output odt and pdf files"
arch=('any')
url="http://relatorio.tryton.org/"
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/r/relatorio/relatorio-$pkgver.tar.gz")
sha512sums=('29b931b3de768375b9e736e4f2254faaf8757b1428efb8f3f1fcfca13a12649bbd07f56c000873c3544f203bf6c8e5bdd1e8851c24705cc504e853fa962fa721')

prepare() {
  cp -a relatorio-$pkgver{,-py2}
}

build() {
  cd "$srcdir/relatorio-$pkgver"
  python setup.py build

  cd "$srcdir/relatorio-$pkgver-py2"
  python2 setup.py build
}

package_python-relatorio() {
  depends=('python-genshi>=0.5' 'python-lxml>=2.0')
  optdepends=('python-pycha>=0.4.0: chart support' 'python-yaml' 'python-magic: fodt support')

  cd "$srcdir/relatorio-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python2-relatorio() {
  depends=('python2-genshi>=0.5' 'python2-lxml>=2.0')
  optdepends=('python2-pycha>=0.4.0: chart support' 'python2-yaml' 'python2-magic: fodt support')

  cd "$srcdir/relatorio-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
