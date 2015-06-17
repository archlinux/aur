# Maintainer: M0Rf30
_pkgname=python2-rudp
pkgname=${_pkgname}-git
pkgver=30.e7f74dd
pkgrel=1
pkgdesc="A rUDP library for Python"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/hoffmabc/python-rudp"
license=('MIT')
options=(!emptydirs)
source=("rudp::git+https://github.com/hoffmabc/python-rudp.git")

pkgver() {
  cd "$srcdir/rudp"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/rudp"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/rudp"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
  
  cd $pkgdir/usr/lib/python2.7/site-packages/
  mv Rudp rudp
}

md5sums=('SKIP')
