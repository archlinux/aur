# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Colin Jones (xentalion) <colin@ergoeclectic.com>
# Contributor: Valère Monseur <valere dot monseur at ymail dot com>

pkgname=cbatticon-gtk3-git
_pkgname=cbatticon
pkgver=1.6.10.r2.g6e3d436
pkgrel=2
pkgdesc='Lightweight battery icon for the system tray'
arch=(x86_64 i686 armv7h)
url='https://github.com/valr/cbatticon'
license=(GPL2)
depends=(gtk3 libnotify)
makedepends=('git')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")

source=("$pkgname::git+https://github.com/valr/cbatticon.git")
sha256sums=('SKIP')

prepare() {
  cd $pkgname
  sed -i -e "s;-Wno-format;$CFLAGS;" Makefile
}

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's,^[^0-9]*,,;s,-([0-9][0-9]*),.r\1,;s,[-_],.,g'
}

build() {
  make -C "$pkgname" WITH_NOTIFY=1 WITH_GTK3=1
}

package() {
  make -C "$pkgname" PREFIX="$pkgdir/usr" install
}

# getver: github.com/valr/cbatticon
# vim: ts=2 sw=2 et:
