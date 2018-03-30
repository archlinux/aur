# Maintainer: Aetf <aetf at unlimitedcodeworks dor xyz>
pkgname=libtsm-patched-git
_gitname=libtsm
pkgver=3.r26.gea1697e
pkgrel=1
pkgdesc="Terminal-emulator State Machine. Patched flavor (using patches from http://github.com/Aetf/libtsm)"
arch=('x86_64' 'armv7h')
url="http://www.freedesktop.org/wiki/Software/kmscon/$_gitname"
license=('MIT')
depends=(glibc)
makedepends=('git' 'libxkbcommon')
provides=('libtsm-patched' 'libtsm')
conflicts=('libtsm' 'libtsm-patched')
options=(!libtool)
source=('git+https://github.com/Aetf/libtsm.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long | sed -r "s/^$_gitname-//;s/([^-]*-g)/r\\1/;s/-/./g"
}

prepare() {
  cd "$srcdir/$_gitname"

  test -f ./configure || NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_gitname/COPYING"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
