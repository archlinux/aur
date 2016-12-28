# Maintainer: VerruckteFuchs <derverrucktefuchs@gmail.com>
pkgname=st-neonwave-git
pkgver=r18.ca2114b
pkgrel=1
pkgdesc="Simple terminal with Xresources, scrollback, alpha support, CPMono font, and neonwave colorscheme"
arch=('i686' 'x86_64')
url="https://github.com/DerVerruckteFuchs/st-neonwave"
license=('MIT')
depends=('libxft' 'libxext' 'otf-cp-mono')
makedepends=('ncurses')
provides=('st-neonwave-git')
conflicts=('st' 'st-xresources-git' 'st-bloated-git' 'st-zenburn-git')
source=('git://github.com/DerVerruckteFuchs/st-neonwave')
md5sums=('SKIP')

pkgver() {
  cd st-neonwave
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd st-neonwave
  sed -i '/\@tic /d' Makefile
}

build() {
  cd st-neonwave
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd st-neonwave
  make PREFIX=/usr DESTDIR="${pkgdir}" TERMINFO="${pkgdir}/usr/share/terminfo" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
