# Maintainer: Mike Pento <mjpento@gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Matt Smith (Majik) <darkknight@helpdesk.zaz.net>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jozef Riha <jose1711@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=gkrellm
pkgver=2.5.1
pkgrel=1
pkgdesc="System monitor package for GTK2"
arch=('x86_64')
url="http://gkrellm.srcbox.net/"
license=('GPL-3.0-or-later')
options+=('!debug')
depends=('gtk2' 'libsm' 'lm_sensors' 'libice' 'pango' 'hicolor-icon-theme' 'glib2' 'glibc' 'openssl' 'libx11' 'gdk-pixbuf2')
makedepends=('gettext')
backup=('etc/gkrellmd.conf')
source=("${url}/releases/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('089e3c1ed398482e682c9900b504ea166a6144a6c9fa041e70c5bbca6b177e63')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make LOCALEDIR=/usr/share/locale
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" \
    SERVICE_DIR=/usr/lib/systemd/system \
    CFGDIR=/etc \
    PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
