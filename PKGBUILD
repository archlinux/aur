# Maintainer: Jonas Malaco <jonas@protocubo.io>
# Contributor: Alex Forencich <alex@alexforencich.com>
pkgname=python-pyusb-git
pkgver=1.2.1.r57.gc248aa5
pkgrel=1
pkgdesc="USB access for Python"
arch=('any')
url="https://github.com/pyusb/pyusb"
license=('BSD')
depends=('python' 'libusb')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm')
checkdepends=('python-pytest')
provides=('python-pyusb')
conflicts=('python-pyusb')

_gitroot='https://github.com/pyusb/pyusb'
_gitname='pyusb'

source=("$_gitname::git+$_gitroot")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags --long --abbrev=7 | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  python setup.py build
}

check() {
  cd "$srcdir/$_gitname"
  python -m pytest
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
