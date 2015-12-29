#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgdesc="Icons for the X Desktop Environment (XDE)"
pkgname=xde-icons
pkgver=1.1.38
pkgrel=1
arch=(any)
license=(CCPL:by-sa)
url="http://github.com/bbidulock/xde-icons"
groups=('xde')
depends=('hicolor-icon-theme' 'mist-icon-theme')
source=("$pkgname::git://github.com/bbidulock/$pkgname.git")
md5sums=('SKIP')
makedepends=('librsvg')
install=xde-icons.install

pkgver() {
  cd $pkgname
  git describe --always | sed 's|-|.|g;s|[.]g[a-f0-9]*$||'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
 cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir/usr/share/icons/hicolor/32x32/apps/arch-logo.png"
  rm -f "$pkgdir/usr/share/icons/hicolor/scalable/apps/arch-logo.svg"
  rm -f "$pkgdir/usr/share/pixmaps/arch-logo.svg"
}

# vim: et sw=2:
