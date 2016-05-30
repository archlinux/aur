# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Simeon Felis <simeonfelis@gmail.com>

pkgname=eekboard-git
_pkgname=eekboard
pkgver=1.0.8.r6.g562c738
pkgrel=1
pkgdesc='Yet Another Virtual Keyboard for Gnome. http://blog.du-a.org/?cat=9'
arch=(i686 x86_64)
url='https://github.com/ueno/eekboard'
license=(GPL3)
depends=('gtk2' 'libxklavier' 'libcanberra')
makedepends=('intltool' 'gtk-doc')
optdepends=('ibus' 'clutter-gtk')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname::git+https://github.com/bbidulock/eekboard")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed -e 's,^[^0-9]*,,;s,\([^-]*-g\),r\1,;s,[-_],.,g'
}

build () {
  cd $pkgname
  ./autogen.sh \
	  --prefix=/usr \
	  --sysconfdir=/etc \
	  --libexecdir=/usr/lib \
	  --enable-gtk-doc \
	  --disable-vala \
	  --with-gtk=2.0
  make PYTHON=/usr/bin/python2 V=1
}
package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

