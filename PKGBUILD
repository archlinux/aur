# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=uwm-git
pkgver=0.30.10
pkgrel=1
pkgdesc="Micro (u) Window Manager"
arch=('i686' 'x86_64')
url="http://uwm.sourceforge.net/"
license=('AGPL3')
provides=('uwm')
conflicts=('uwm')
depends=('xcb-util-renderutil' 'xcb-util-image' 'xcb-util-keysyms' 'bash' 'libpng' 'libjpeg' 'xcb-util-wm')
makedepends=('git')
source=("$pkgname::git://git.code.sf.net/p/uwm/code")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --always | sed 's,^[^0-9]*,,;s,-,.,g;s,\.g[a-f0-9]*$,,'
}

build() {
  cd $pkgname
  make all contrib/uwm-helper uwm.1 uwmrc.5
}

package() {
  cd $pkgname
  install -Dm0755 uwm "$pkgdir/usr/bin/uwm"
  install -Dm0755 contrib/uwm-helper "$pkgdir/usr/bin/uwm-helper"
  install -Dm0644 uwm.1 "$pkgdir/usr/share/man/man1/uwm.1"
  install -Dm0644 uwmrc.5 "$pkgdir/usr/share/man/man5/uwmrc.5"
}


# vim: set sw=2 et:
