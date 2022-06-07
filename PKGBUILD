#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgdesc="Icons for the X Desktop Environment (XDE)"
pkgname=xde-icons-git
_pkgname=xde-icons
pkgver=1.7.r1.gd93cd9c
pkgrel=2
arch=('any')
license=(CCPL:by-sa)
url="https://github.com/bbidulock/xde-icons"
groups=('xde-git')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}" 'ayatana-indicator-session')
depends=('hicolor-icon-theme' 'mist-icon-theme')
makedepends=('librsvg' 'git')
source=("$pkgname::git+https://github.com/bbidulock/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,-,.,g'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
 cd $pkgname
  ./configure
  make
}

package() {
  make -C $pkgname DESTDIR="$pkgdir" install
  rm -f "$pkgdir/usr/share/icons/hicolor/32x32/apps/arch-logo.png"
  rm -f "$pkgdir/usr/share/icons/hicolor/scalable/apps/arch-logo.svg"
  rm -f "$pkgdir/usr/share/pixmaps/arch-logo.svg"
}

# vim: et sw=2:
