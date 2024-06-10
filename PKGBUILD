# Maintainer: Donald Carr <d at chaos-reins dot com>

_qmake="qmake"
_pkgname=literm
pkgname=${_pkgname}-git
pkgver=0.0.328
pkgrel=1
pkgdesc='literm is a terminal emulator: the design goal is to be simplistic while still providing a reasonable amount of features.'
arch=('any')
url='https://github.com/rburchell/literm'
license=('GPL2')
source=("git+https://github.com/rburchell/literm.git")
sha256sums=('SKIP')

pkgver () {
  cd "$srcdir/$_pkgname"

  echo "0.0.$(git rev-list --count HEAD)"
  # git describe --tags --long | sed -r 's/^v//;s/-RC/RC/;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  $_qmake
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make INSTALL_ROOT="$pkgdir" install

}
