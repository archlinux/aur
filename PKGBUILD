# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=blackbox-git
pkgver=0.77.r3.gadb18c6
pkgrel=1
pkgdesc="A window manager for X11"
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/blackboxwm"
license=('MIT')
provides=('blackbox' 'blackboxwm')
conflicts=('blackbox' 'blackbox-cvs' 'blackboxwm')
depends=('libxext' 'libxft')
options=('!libtool' 'staticlibs')
makedepends=('git')
source=("$pkgname::git+https://github.com/bbidulock/blackboxwm.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
      --enable-static \
      --enable-shared
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim: et sw=2:
