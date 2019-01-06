# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=adaptagrams-git
_pkgname=${pkgname%-git}
pkgver=r1194.86b46ed
pkgrel=1
pkgdesc="A library for adaptive diagramming applications"
arch=('i686' 'x86_64')
url="https://github.com/mjwybrow/$_pkgname"
license=('LGPL')
optdepends=('cairo')
makedepends=('git')
options=('!libtool')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname/cola"
  mkdir m4 || true
  aclocal
  autoreconf --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname/cola"
  make DESTDIR="$pkgdir" install
  install -m644 "libcola/exceptions.h" "$pkgdir/usr/include/libcola/"
}
