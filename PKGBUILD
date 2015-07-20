# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-vxi11-git
pkgver=0.8.r0.g8826b85
pkgrel=1
pkgdesc="A Python VXI-11 driver for controlling instruments over Ethernet."
arch=('any')
url="https://github.com/python-ivi/python-vxi11"
license=('MIT')
depends=('python')
makedepends=('git')
provides=('python-vxi11')

_gitroot='https://github.com/python-ivi/python-vxi11.git'
_gitname='python-vxi11'

source=("$_gitname::git+$_gitroot")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  sed -i "s/'vxi11-cli/'python-vxi11-cli/" setup.py
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  cd "$pkgdir"
  cd usr
  cd bin
  ln -s python-vxi11-cli vxi11-cli
}

