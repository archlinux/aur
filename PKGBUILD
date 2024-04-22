# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Co-Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Co-Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=lxqt-globalkeys
pkgname=$_pkgname-git
pkgver=2.0.0
pkgrel=1
pkgdesc="LXQt daemon and library for global keyboard shortcuts registration."
arch=("i686" "x86_64")
url="https://lxqt-project.org"
license=("LGPL-2.1-only")
depends=('liblxqt-git')
makedepends=('git' 'cmake' 'qt6-tools' 'lxqt-build-tools-git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=('SKIP')

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
