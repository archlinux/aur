# Maintainer: willemw <willemw12@gmail.com>

_pkgname2=python2-spyder-kernels
_pkgname3=python-spyder-kernels
pkgbase=$_pkgname3-git
pkgname=($_pkgname3-git $_pkgname2-git)
pkgver=1.0.1.r1.g5c33e3a
pkgrel=1
arch=('any')
url="https://github.com/spyder-ide/spyder-kernels"
license=('MIT')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
source=($_pkgname2::git://github.com/spyder-ide/spyder-kernels.git)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname2
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
} 

prepare() {
  rm -rf $_pkgname3
  cp -a $_pkgname2 $_pkgname3
}

build() {
  cd "$srcdir/$_pkgname2"
  python2 setup.py build

  cd "$srcdir/$_pkgname3"
  python setup.py build
}

package_python2-spyder-kernels-git() {
  pkgdesc="Spyder console Jupyter kernels"
  depends=('python2-cloudpickle' 'python2-ipykernel')
  provides=($_pkgname2)
  conflicts=($_pkgname2)

  cd $_pkgname2
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python-spyder-kernels-git() {
  pkgdesc="Spyder console Jupyter kernels"
  depends=('python-cloudpickle' 'python-ipykernel')
  provides=($_pkgname3)
  conflicts=($_pkgname3)

  cd $_pkgname3
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

