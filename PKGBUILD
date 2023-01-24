# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Peter Mattern <pmattern at arcor dot de>

_pkgname=lxqt-build-tools-qt6
pkgname=$_pkgname-git
pkgver=0.12.0.1.ge2786d4
pkgrel=1
pkgdesc='Tools to build LXQt and components maintained by the project.'
arch=('any')
url='https://github.com/lxde/lxqt-build-tools'
license=('BSD')
depends=('bash')
makedepends=('git' 'cmake' 'qt6-base')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/lxde/lxqt-build-tools.git#branch=lxqt2-qt6")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --always | sed "s/-/./g"
}

build() {
  rm -Rf build ; mkdir build
  cd build
  cmake "$srcdir"/$_pkgname -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  install -D -m644 "$srcdir"/$_pkgname/BSD-3-Clause "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
