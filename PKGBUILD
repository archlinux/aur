# Maintainer: Aetf <7437103@gmail.com>
pkgname=libtsm-git
_gitname=libtsm
pkgver=0.0.0
pkgrel=2
pkgdesc="Terminal-emulator State Machine"
arch=('i686' 'x86_64')
url="http://www.fredesktop.org/wiki/Software/kmscon/$_gitname"
license=('MIT')
depends=(glibc)
makedepends=('git' 'libxkbcommon')
provides=('libtsm')
conflicts=('libtsm')
options=(!libtool)
source=('git://people.freedesktop.org/~dvdhrm/libtsm')
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long | sed -r "s/^$_gitname-//;s/([^-]*-g)/r\\1/;s/-/./g"
}

build() {
  cd "$srcdir/$_gitname"

  test -f ./configure || NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_gitname/COPYING"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
