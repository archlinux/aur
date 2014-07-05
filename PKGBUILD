# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=etwm-git
pkgver=3.8.3.r0.g3488e96
pkgrel=2
pkgdesc="Claude's Tab Window Manager with full ICCCM/EMWH support."
arch=('i686' 'x86_64')		
url="https://github.com/bbidulock/etwm/"
license=('custom:MIT/X Consortium')
provides=('etwm')
conflicts=('etwm')
depends=('libxinerama' 'libxrandr' 'libxmu' 'libxpm' 'libjpeg')
makedepends=('git')
backup=('usr/share/X11/etwm/system.etwmrc')
options=('!emptydirs')
source=("$pkgname::git+https://github.com/bbidulock/etwm.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's,([^-]*-g),r\1,;s,-,.,g'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --silent --prefix=/usr --sysconfdir=/etc
  make V=0 etwmdir=/usr/share/X11/etwm
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" etwmdir=/usr/share/X11/etwm install
  install -Dm0644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set et sw=2:
