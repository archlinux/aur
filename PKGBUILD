# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=adwm-git
pkgver=0.5.4.r0.g9fee439
pkgrel=1
pkgdesc="Advanced dynamic window manager for X"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/adwm"
license=('GPL')
provides=('adwm')
conflicts=('adwm')
depends=('libxfixes' 'libxft' 'libxrandr' 'libxinerama' 'libxpm' 'startup-notification' 'imlib2')
options=('!libtool')
makedepends=('git' 'pkgconfig' 'libxi')
source=("$pkgname::git+https://github.com/bbidulock/adwm")
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
  ./configure --prefix=/usr
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
