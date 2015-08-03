# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmx-git
_pkgname=wmx
pkgver=r103.b936e55
pkgrel=1
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
