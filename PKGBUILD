# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=(python-usbtmc-git python2-usbtmc-git)
pkgver=0.8.r0.g008052b
pkgrel=1
pkgdesc="A Python USBTMC driver for controlling instruments over USB."
arch=('any')
url="https://github.com/python-ivi/python-usbtmc"
license=('MIT')
makedepends=('git')

_gitroot='https://github.com/python-ivi/python-usbtmc.git'
_gitname='python-usbtmc'

source=("$_gitname::git+$_gitroot")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package_python-usbtmc-git() {
  depends=('python' 'python-pyusb')
  provides=('python-usbtmc')
  conflicts=('python-usbtmc')

  cd "$srcdir/$_gitname"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1

  install -m 0644 -D usbtmc.rules $pkgdir/etc/udev/rules.d/40-usbtmc.rules
}

package_python2-usbtmc-git() {
  depends=('python2' 'python2-pyusb')
  provides=('python2-usbtmc')
  conflicts=('python2-usbtmc')

  cd "$srcdir/$_gitname"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

