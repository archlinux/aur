# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=flwm-git
_pkgname=flwm
pkgver=1.14.r5.g8e300f1
pkgrel=1
pkgdesc="Fast Light Window Manager"
arch=('i686' 'x86_64')
url="http://flwm.sourceforge.net/"
license=('GPL')
provides=('flwm')
conflicts=('flwm' 'flwm-tc')
depends=('fltk')
source=("$pkgname::git+https://github.com/bbidulock/flwm.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make V=0
}

package() {
  cd $pkgname
  install -Dm0755 flwm "$pkgdir/usr/bin/flwm"
  install -Dm0644 flwm.1 "$pkgdir/usr/share/man/man1/flwm.1"
  install -Dm0644 flwm.desktop "$pkgdir/usr/share/xsessions/flwm.desktop"
  install -Dm0644 logo.png "$pkgdir/usr/share/pixmaps/flwm.png"
}

# vim:set ts=2 sw=2 et:
