# Maintainer: JP Cimalando <jp-dev@inbox.ru>
pkgname=pd-flext-git
_pkgname=flext
pkgver=r1362.4280d93
pkgrel=1
pkgdesc="C++ development layer for Pure Data"
arch=('i686' 'x86_64')
url="https://grrrr.org/research/software/flext/"
license=('GPL')
groups=()
depends=('gcc-libs')
makedepends=('git' 'pd')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=('staticlibs')
install=
source=("$_pkgname::git+https://github.com/grrrr/flext.git")
md5sums=('SKIP')
noextract=()

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  ./bootstrap.sh
  ./configure --prefix=/usr --with-sdkdir=/usr/include/pd
  make
}

check() {
  cd "$srcdir/$_pkgname"
  make -k check
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}
