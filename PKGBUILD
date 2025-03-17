# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Matt Smith (Majik) <darkknight@helpdesk.zaz.net>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jozef Riha <jose1711@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=gkrellm
pkgver=2.4.0
pkgrel=1
pkgdesc="System monitor package for GTK2"
arch=('x86_64')
url="http://gkrellm.srcbox.net/"
license=('GPL-3.0-or-later')
depends=('gtk2' 'libsm' 'lm_sensors')
makedepends=('gettext')
backup=('etc/gkrellmd.conf')
source=("${url}/releases/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('6f83665760b936ad4b55f9182b1ec7601faf38a0f25ea1e4bddc9965088f032d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make LOCALEDIR=/usr/share/locale
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" \
    SERVICE_DIR="$pkgdir"/usr/lib/systemd/system \
    CFGDIR="$pkgdir"/etc \
    PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
