# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmx-git
_pkgname=wmx
pkgver=7.1.r0.gb936e55
pkgrel=2
pkgdesc="The ideal window manager for today's elegant and ascetic programmer"
arch=('x86_64' 'i686')
url="http://www.all-day-breakfast.com/wmx/"
license=('custom')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('libxft' 'libxpm' 'libxcomposite')
makedepends=('git')
source=("$pkgname::svn://svn.code.sf.net/p/wm2/code/trunk/wmx")
source=("$pkgname::git+https://github.com/bbidulock/wmx.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long|sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,-,.,g'
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
