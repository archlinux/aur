# Maintainer: willemw <willemw12@gmail.com>

_pkgname=python-qtawesome
_pkgname2=python2-qtawesome
pkgbase=$_pkgname-git
pkgname=($_pkgname-git $_pkgname2-git)
pkgver=0.2.0.r4.gcdacb25
pkgrel=2
pkgdesc="Enables iconic fonts such as Font Awesome and Elusive Icons in PyQt and PySide applications"
arch=('any')
url="https://github.com/spyder-ide/qtawesome"
license=('MIT')
makedepends=('python-setuptools' 
             'python2-setuptools'
             'git')
source=($_pkgname::git://github.com/spyder-ide/qtawesome.git)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
} 

prepare() {
  rm -rf $_pkgname2
  cp -a $_pkgname $_pkgname2
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build

  cd "$srcdir/$_pkgname2"
  python2 setup.py build
}

package_python-qtawesome-git() {
  depends=('python-qtpy')
  provides=($_pkgname)
  conflicts=($_pkgname)

  cd $_pkgname
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python2-qtawesome-git() {
  depends=('python2-qtpy')
  provides=($_pkgname2)
  conflicts=($_pkgname2)

  cd $_pkgname2
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

