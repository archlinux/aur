# Maintainer:  Quint Guvernator <quint@guvernator.net>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=dwm-qguv-git
_pkgname=dwm
pkgver=6.1.53.gcdf1f69df708
pkgrel=1
pkgdesc="A dynamic window manager for X"
url="http://dwm.suckless.org"
arch=('i686' 'x86_64')
license=('MIT')
options=(zipman)
depends=('libx11' 'libxinerama' 'libxft')
makedepends=('git')
provides=('dwm')
conflicts=('dwm')
source=(dwm.desktop
        "$_pkgname::git+https://github.com/qguv/dwm#branch=patchset")
md5sums=('939f403a71b6e85261d09fc3412269ee'
         'SKIP')

pkgver(){
  cd $_pkgname
  git describe --tags |sed 's/-/./g'
}

build() {
  cd $_pkgname
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  (
    cd $_pkgname
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README"
  )

  install -m644 -D dwm.desktop "$pkgdir/usr/share/xsessions/dwm.desktop"
}

# vim:set ts=2 sw=2 et:
