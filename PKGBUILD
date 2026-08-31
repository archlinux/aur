gitname=nmtree
pkgname="$gitname-git"
pkgver=1.0.0.r4.g4e91bfa2
pkgrel=1
pkgdesc='NetBSD filesystem hierarchy utility, ported to Linux'
arch=('x86_64')
url="https://github.com/archiecobbs/${gitname}"
license=('BSD-3-Clause' 'BSD-4-Clause' 'NTP')
depends=('glibc' 'libnbcompat>=1:1.0.2')
makedepends=('autoconf' 'automake')
provides=('nmtree')
conflicts=('nmtree')
source=("git+$url.git")
sha256sums=('SKIP')
pkgver() {
  cd "${srcdir}/${gitname}"
  git describe --long --tags --abbrev=8 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
  cd "$srcdir/$gitname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$gitname"
  # libarchive has mtree.5 so don't conflict
  make DESTDIR="$pkgdir" docdir="/usr/share/doc/$pkgname" man_MANS='mtree.8' install
}
