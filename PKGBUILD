# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python2-txaio
pkgver=18.8.1
pkgrel=1
pkgdesc='Compatibility API between asyncio/Twisted/Trollius'
arch=('any')
url="https://github.com/crossbario/txaio"
license=('MIT')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest' 'python2-mock' 'python2-twisted')
depends=('python2-six')
source=("https://pypi.io/packages/source/t/txaio/txaio-$pkgver.tar.gz"
        "make-pytest-happy.patch")

prepare() {
 # https://github.com/crossbario/txaio/issues/140
 patch -Np1 -d txaio-$pkgver <make-pytest-happy.patch
 
 cp -a txaio-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/txaio-$pkgver-py2
  python2 setup.py build
}
 
package() {
  cd txaio-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
md5sums=('ecdd4d0f401c7f01f22830b4d2788593'
         '862ac257bb05a8064b6e2814686dcb3c')
