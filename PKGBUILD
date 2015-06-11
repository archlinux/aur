# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmx-svn
_pkgname=wmx
pkgver=r114
pkgrel=2
pkgdesc="The ideal window manager for today's elegant and ascetic programmer"
arch=('x86_64' 'i686')
url="http://www.all-day-breakfast.com/wmx/"
license=('custom')
provides=('wmx')
conflicts=('wmx')
depends=('libxft' 'libxpm' 'libxcomposite')
source=("$pkgname::svn://svn.code.sf.net/p/wm2/code/trunk/wmx")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd $pkgname
  autoreconf -fiv
  sed -e 's,/usr/local/bin/,,' -i wmx.desktop
  sed -e 's,x-terminal-emulator,xterm,' -i Config.h
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  install -Dm755 wmx "$pkgdir/usr/bin/wmx"
  install -Dm644 wmx.desktop "$pkgdir/usr/share/xsessions/wmx.desktop"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 README.contrib "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
