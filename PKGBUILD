# Contributor: Richard PALO <richard.palo@free.fr>
# Contributor: Florian Walch <florian.walch@gmx.at>
# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=('python-relatorio' 'python2-relatorio')
pkgver=0.9.0
pkgrel=1
pkgdesc="A templating library able to output odt and pdf files"
arch=('any')
url="http://relatorio.tryton.org/"
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/r/relatorio/relatorio-$pkgver.tar.gz")
sha512sums=('d8f5c2a6c6fd207de4f651a8abe8802de0a0a30b35c659136e52868c5721f719e53bc771019a8a4448615432696c149298b2306fcacadcc0737fa6b08a53b345')

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
