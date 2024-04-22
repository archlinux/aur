# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Jerome Leclanche <jerome at leclan dot ch>

_pkgname=libsysstat
pkgname=$_pkgname-git
pkgver=1.0.0
pkgrel=1
pkgdesc='Library to query system information like CPU and memory usage or network traffic'
arch=('i686' 'x86_64' 'armv6h')
url='https://github.com/lxqt/libsysstat'
license=("LGPL-2.1-only")
depends=('qt6-base')
makedepends=('git' 'cmake' 'lxqt-build-tools-git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed "s/-/.r/;s/-/./"
}

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$_pkgname" \
              -DCMAKE_INSTALL_PREFIX=/usr \
              -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
