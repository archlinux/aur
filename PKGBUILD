# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=(python-pyusb-git python2-pyusb-git)
pkgver=1.0.0.r18.g1f66ccd
pkgrel=1
pkgdesc="Easy USB access from Python"
arch=('any')
url="http://sourceforge.net/apps/trac/pyusb/"
license=('BSD')
depends=('python' 'libusb')
makedepends=('git')
provides=('python-pyusb')

_gitroot='https://github.com/walac/pyusb'
_gitname='pyusb'

source=("$_gitname::git+$_gitroot")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
}

package_python-pyusb-git() {
  depends=('python' 'libusb')
  provides=('python-pyusb')
  conflicts=('python-pyusb')

  cd "$srcdir/$_gitname"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

package_python2-pyusb-git() {
  depends=('python2' 'libusb')
  provides=('python2-pyusb')
  conflicts=('python2-pyusb')

  cd "$srcdir/$_gitname"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

