# Maintainer: Brian Salcedo <brian@salcedo.tech>
pkgname=st-bloated-git
pkgver=r1036.2b5354e
pkgrel=4
pkgdesc="simple terminal with alpha, copyurl, hidecursor, open copied url, scrollback, spoiler, vertcenter, and xresources patches."
arch=('i686' 'x86_64')
url="https://git.salcedo.tech/salcedo/st-bloated"
license=('MIT/X')
depends=('libxft' 'libxext' 'ncurses')
makedepends=('git')
provides=('st-bloated-git')
conflicts=('st-ametisf-git' 'st-git' 'st-jellybeans' 'st-n1' 'st-neonwave-git' 'st-patched-git' 'st-pizz' 'st-qguv-git' 'st-scrollback-git' 'st-solarized' 'st-solarized-powerline' 'st-test' 'st-tomorrownight' 'st-white' 'st-white-git' 'st-xresources-git' 'st-zenburn-26px-git' 'st-zenburn-git')
source=('git+https://git.salcedo.tech/salcedo/st-bloated.git#branch=0.8.1-bloated')
md5sums=('SKIP')

pkgver() {
  cd st-bloated
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd st-bloated
  sed -i 's/tic/#tic/' Makefile
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
