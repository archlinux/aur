# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Rax Garfield <admin@dvizho.ks.ua>

_pkgname=qutepart
pkgname=qutepart-git
pkgver=3.1.r3.ga869bf5
pkgrel=1
pkgdesc="Code editor component for PyQt and Pyside"
arch=('any')
url="https://github.com/hlamer/qutepart/"
license=('LGPL')
makedepends=('git' 'python-setuptools')
depends=('python-pyqt5')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git://github.com/hlamer/$_pkgname.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  _PYTHON_VERSION="$(echo "$(python --version)" | awk '{ print $2 }' | awk -F'.' '{ print $1 "." $2 }')"
  install -d "$pkgdir/usr/lib/python$_PYTHON_VERSION/site-packages/"
  cp -rp build/lib.linux-$CARCH-$_PYTHON_VERSION/* "$pkgdir/usr/lib/python$_PYTHON_VERSION/site-packages/"
}

