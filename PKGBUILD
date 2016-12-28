# Maintainer: VerruckteFuchs <derverrucktefuchs@gmail.com>
pkgname=st-zenburn-git
pkgver=r18.ca2114b
pkgrel=1
pkgdesc="Simple terminal with Xresources, scrollback, alpha support, Office Code Pro font, and zenburn colorscheme"
arch=('i686' 'x86_64')
url="https://github.com/DerVerruckteFuchs/st-zenburn"
license=('MIT')
depends=('libxft' 'libxext')
makedepends=('ncurses')
provides=('st-zenburn-git')
conflicts=('st' 'st-xresources-git' 'st-bloated-git' 'st-neonwave-git')
source=('git://github.com/DerVerruckteFuchs/st-zenburn')
md5sums=('SKIP')

pkgver() {
  cd st-zenburn
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd st-zenburn
  sed -i '/\@tic /d' Makefile
}

build() {
  cd st-zenburn
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd st-zenburn
  make PREFIX=/usr DESTDIR="${pkgdir}" TERMINFO="${pkgdir}/usr/share/terminfo" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
