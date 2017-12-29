# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=(python-vxi11-git python2-vxi11-git)
pkgver=0.9.r5.gcc4671d
pkgrel=1
pkgdesc="A Python VXI-11 driver for controlling instruments over Ethernet."
arch=('any')
url="https://github.com/python-ivi/python-vxi11"
license=('MIT')
makedepends=('git' 'python-setuptools' 'python2-setuptools')

_gitroot='https://github.com/python-ivi/python-vxi11.git'
_gitname='python-vxi11'

source=("$_gitname::git+$_gitroot")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package_python-vxi11-git() {
  depends=('python')
  provides=('python-vxi11')
  conflicts=('python-vxi11')

  cd "$srcdir/$_gitname"
  sed -i "s/'.*-cli/'python-vxi11-cli/" setup.py
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  cd "$pkgdir/usr/bin"
  ln -s python-vxi11-cli vxi11-cli
}

package_python2-vxi11-git() {
  depends=('python2')
  provides=('python2-vxi11')
  conflicts=('python2-vxi11')

  cd "$srcdir/$_gitname"
  sed -i "s/'.*-cli/'python2-vxi11-cli/" setup.py
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

