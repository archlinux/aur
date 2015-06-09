# $Id$
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tobias Kieslich <tobias funnychar archlinux.org>
# Maintainer: Aaditya Bagga <aaditya_gnulinux@zoho.com>

pkgname=xfce4-power-manager-upower
_pkgname=xfce4-power-manager
pkgver=1.4.4
pkgrel=1
pkgdesc="Power manager for Xfce desktop, with upower 0.9.23 and Consolekit2 support"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('upower=0.9.23' 'libnotify' 'hicolor-icon-theme' 'consolekit')
optdepends=('xfce4-panel: for the Xfce panel plugin')
makedepends=('intltool' 'xfce4-panel')
conflicts=('xfce4-power-manager')
provides=('xfce4-power-manager')
replaces=('xfce4-power-manager-pmu')
install=${_pkgname}.install
source=(http://archive.xfce.org/src/apps/$_pkgname/1.4/$_pkgname-$pkgver.tar.bz2)
sha256sums=('c50ec8aa7e7848c57c0f856dceb8132eb5f37585f0ac1627459ab8c882c73b07')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-network-manager \
    --enable-polkit \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
