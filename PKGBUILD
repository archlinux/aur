# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=windwm-git
_pkgname=windwm
pkgver=1.5
pkgrel=1
pkgdesc="Wind is window manager  implements most parts of the ICCCM and EWMH/NetWM standards"
arch=('x86_64' 'i686')
url="http://windwm.sourceforge.net/"
license=('custom')
provides=('windwm')
conflicts=('windwm')
depends=('libxft')
makedepends=('git')
source=("git://git.code.sf.net/p/windwm/code"
        "windwm.desktop")
md5sums=('SKIP'
         '9568e6caf809710bf147f5e947ac1517')
_gitname=code

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g;s|[.]g[a-f0-9]*$||;s|^v||'
}

prepare() {
  cd $_gitname
}

build() {
  cd $_gitname
  autoreconf -fiv
  ./configure --prefix=/usr/ --mandir=/usr/share/man
  make V=0
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd "$srcdir"
  install -Dm0644 windwm.desktop "$pkgdir/usr/share/xsessions/windwm.desktop"
}

# vim: et sw=2:
