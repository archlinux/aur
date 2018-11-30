# Maintainer: Thomas Glamsch <thomas (dot) glamsch (at) gmail (dot) com>

pkgname=python-xwiimote-git
_pkgname=xwiimote-bindings
pkgver=20131028
pkgrel=2
pkgdesc="Open Source Nintendo Wii Remote Linux Device Driver (Python Bindings)"
url="http://dvdhrm.github.io/xwiimote"
license=('MIT')
arch=('i686' 'x86_64')
depends=('xwiimote')
makedepends=('git' 'swig')
source=('git://github.com/dvdhrm/xwiimote-bindings.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git log -1 --format=%cd --date=%Y%m%d
}

prepare() {
  cd "$srcdir/$_pkgname"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$srcdir/$_pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/usr/lib/perl5"
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
