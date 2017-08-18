# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=expat-git
pkgver=2.2.3.r39.g2cb09ae
pkgrel=1
pkgdesc="A stream-oriented XML parser library written in C"
arch=('i686' 'x86_64')
url="https://libexpat.github.io/"
license=('custom')
depends=('glibc')
makedepends=('git' 'cmake')
provides=('expat')
conflicts=('expat')
source=("git+https://github.com/libexpat/libexpat.git")
sha256sums=('SKIP')


prepare() {
  cd "libexpat/expat"

  mkdir -p "build"
}

pkgver() {
  cd "libexpat/expat"

  git describe --long --tags | sed 's/^R_//;s/\([^-]*-g\)/r\1/;s/[_-]/./g'
}

build() {
  cd "libexpat/expat/build"

  cmake -DCMAKE_INSTALL_PREFIX="/usr" ../
  make
}

check() {
  cd "libexpat/expat/build"

  make test
}

package() {
  cd "libexpat/expat/build"

  make DESTDIR="$pkgdir" install
  install -Dm644 "../COPYING" "$pkgdir/usr/share/licenses/expat/COPYING"
}
