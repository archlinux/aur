# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=lxqt-sudo
pkgname=$_pkgname-git
pkgver=2.0.0
pkgrel=1
pkgdesc="Qt front-end for sudo. Part of but not restricted to LXQt."
arch=("i686" "x86_64")
url="https://lxqt-project.org"
license=('LGPL-2.1-only')
depends=('sudo' 'liblxqt-git')
optdepends=('oxygen-icons: fallback icon theme on systems without LXQt')
makedepends=('git' 'cmake' 'qt6-tools' 'lxqt-build-tools-git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed "s/-/.r/;s/-/./"
}

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$_pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
