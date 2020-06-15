# $Id: PKGBUILD 193939 2013-09-07 07:11:31Z lcarlier $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-twm-git
_pkgname=xorg-twm
pkgver=1.0.11.r0.gc2859ef
pkgrel=1
pkgdesc="Tab Window Manager for the X Window System"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
backup=(usr/share/X11/twm/system.twmrc)
license=('custom')
depends=('libxmu')
makedepends=('git' 'xorg-util-macros')
source=($pkgname::git://anongit.freedesktop.org/xorg/app/twm)
sha256sums=('SKIP')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/twm-//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
