# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=lxqt-build-tools
pkgname=$_pkgname-git
pkgver=0.3.2
pkgrel=1
pkgdesc='Tools to build LXQt and components maintained by the project.'
arch=('any')
url='https://github.com/lxqt/lxqt-build-tools'
license=('BSD')
makedepends=('git' 'qt5-base')
depends=('cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  git describe --always | sed "s/-/./g"
}

build() {
  rm -Rf build ; mkdir build
  cd build
  cmake $srcdir/$_pkgname -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  install -D -m644 $srcdir/$_pkgname/BSD-3-Clause $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
