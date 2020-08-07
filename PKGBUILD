# Contributor: Richard PALO <richard.palo@free.fr>
# Contributor: Florian Walch <florian.walch@gmx.at>
# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=('python-relatorio' 'python2-relatorio')
pkgver=0.9.2
pkgrel=1
pkgdesc="A templating library able to output odt and pdf files"
arch=('any')
url="http://relatorio.tryton.org/"
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/r/relatorio/relatorio-$pkgver.tar.gz")
sha512sums=('7e686dc7beb9296e320b0bd7806faffba63e623f79ac8eee520c1820f82c5dabaaa0f31b89773b2be9e70f407ed1764ef1f56b9e265d145514a24b1944795511')

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
