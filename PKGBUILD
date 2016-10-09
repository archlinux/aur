# Maintainer: Felix Morgner <felix.morgner@gmail.com>

pkgname=('dscreen-git')
pkgver=0.1.0.r0.g659af0c
pkgrel=1
pkgdesc="A DBus wrapper for xscreensaver"
arch=('any')
url="https://github.com/fmorgner/dscreen.git"
license=('BSD')
makedepends=('python-setuptools' 'git')
depends=('python-gobject')
source=('dscreen-git::git+https://github.com/fmorgner/dscreen.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --optimize=1 --root=${pkgdir}
  install -m755 -d "${pkgdir}/usr/share/licenses/dscreen/"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/dscreen/"
}
