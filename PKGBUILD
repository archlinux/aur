# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=pysingular
pkgname=(python2-pysingular python-pysingular)
pkgver=0.9.5
pkgrel=1
pkgdesc="A Python interface to Singular"
arch=(i686 x86_64)
url="https://github.com/sebasguts/SingularPython"
license=(GPL2)
makedepends=(python-setuptools python2-setuptools singular)
source=("https://pypi.io/packages/source/P/PySingular/PySingular-$pkgver.tar.gz")
md5sums=('f2698b633915199fc27c9772e4688754')

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

