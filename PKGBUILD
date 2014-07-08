#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xorg-xsm-git
pkgdesc="X Session Manager"
pkgver=1.0.3.r6.g0caed2f
pkgrel=1
arch=('x86_64' 'i686')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libxaw' 'xorg-smproxy' 'xorg-iceauth' 'xorg-rstart')
provides=('xorg-xsm')
conflicts=('xorg-xsm')
makedepends=('git' 'pkgconfig' 'xorg-util-macros' 'xtrans')
optdepends=('xorg-twm: for window manager in default scripts')
source=("$pkgname::git://anongit.freedesktop.org/git/xorg/app/xsm");
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's,xsm-,,;s,([^-]*-g),r\1,;s,-,.,g'
}

prepare() {
  cd $pkgname
  autoreconf -fi
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
