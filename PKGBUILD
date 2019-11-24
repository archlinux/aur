# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Clint Valentine <valentine.clint@gmail.com>
pkgname=('python-pybigwig' 'python2-pybigwig')
_pkgname=pyBigWig
pkgver=0.3.17
pkgrel=1
pkgdesc="A Python extension for quick access to bigWig and bigBed files"
arch=('any')
url="https://github.com/deeptools/pyBigWig"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=($_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('a1ccd607db0ece1553471cab3763e318609171a8219a7e0625bc80b61479f8d7')

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
