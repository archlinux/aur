# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=pysingular
pkgname=(python2-pysingular python-pysingular)
pkgver=0.9.1
pkgrel=1
pkgdesc="A Python interface to Singular"
arch=(i686 x86_64)
url="https://github.com/sebasguts/SingularPython"
license=(GPL2)
makedepends=(python-setuptools python2-setuptools singular)
source=("https://pypi.io/packages/source/P/PySingular/PySingular-$pkgver.tar.gz")
md5sums=('be1913a73d6c5aaea7872202e55a4346')

prepare() {
  cp -r PySingular-$pkgver PySingular-$pkgver-py2
}

build() {
  cd PySingular-$pkgver
  python setup.py build

  cd ../PySingular-$pkgver-py2
  python2 setup.py build
}

package_python2-pysingular() {
  depends=(python2 singular)
  cd PySingular-$pkgver-py2

  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python-pysingular() {
  depends=(python singular)
  cd PySingular-$pkgver
  
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

