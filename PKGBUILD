# Maintainer: Brian Salcedo <bsalcedo@gmx.us>
pkgname=st-bloated-git
pkgver=r3.91a71ac
pkgrel=1
pkgdesc="Simple terminal with Xresources, scrollback, and alpha support"
arch=('i686' 'x86_64')
url="https://github.com/salcedo/st-bloated"
license=('MIT')
depends=('libxft' 'libxext')
makedepends=('ncurses')
provides=('st-bloated-git')
conflicts=('st' 'st-xresources-git')
source=('git://github.com/salcedo/st-bloated')
md5sums=('SKIP')

pkgver() {
  cd st-bloated
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd st-bloated
  sed -i '/\@tic /d' Makefile
}

build() {
  cd st-bloated
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd st-bloated
  make PREFIX=/usr DESTDIR="${pkgdir}" TERMINFO="${pkgdir}/usr/share/terminfo" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
