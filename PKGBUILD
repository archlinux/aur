#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgdesc="Icons for the X Desktop Environment (XDE)"
pkgname=xde-icons-git
_pkgname=xde-icons
pkgver=1.3
pkgrel=1
arch=('any')
license=(CCPL:by-sa)
url="http://github.com/bbidulock/xde-icons"
groups=('xde')
depends=('hicolor-icon-theme' 'mist-icon-theme')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
makedepends=('librsvg' 'git')
source=("$pkgname::git://github.com/bbidulock/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe| sed 's|-|.|g;s|[.]g[a-f0-9]*$||'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
 cd $pkgname
  ./configure --sysconfdir=/etc
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir/usr/share/icons/hicolor/32x32/apps/arch-logo.png"
  rm -f "$pkgdir/usr/share/icons/hicolor/scalable/apps/arch-logo.svg"
  rm -f "$pkgdir/usr/share/pixmaps/arch-logo.svg"
}

# vim: et sw=2:
