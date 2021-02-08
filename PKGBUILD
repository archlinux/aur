# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Clint Valentine <valentine.clint@gmail.com>
pkgname=('python-pybigwig' 'python2-pybigwig')
_pkgname=pyBigWig
pkgver=0.3.18
pkgrel=1
pkgdesc="A Python extension for quick access to bigWig and bigBed files"
arch=('any')
url="https://github.com/deeptools/pyBigWig"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=($_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('552564d8ce8720a8ae70ed5e5534617fb0cab306b666468d1c61b6d389b8a10c')

prepare() {
  cp -a $_pkgname-$pkgver{,-py2}
}

build(){
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py build

  cd "$srcdir"/$_pkgname-$pkgver-py2
  python2 setup.py build
}

package_python2-pybigwig() {
  depends=('curl' 'python2-numpy')

  cd $_pkgname-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

package_python-pybigwig() {
  depends=('curl' 'python-numpy')

  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
