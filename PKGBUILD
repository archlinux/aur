# Maintainer: Mike Pento <mjpento@gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Matt Smith (Majik) <darkknight@helpdesk.zaz.net>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jozef Riha <jose1711@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=gkrellm
pkgver=2.5.0
pkgrel=1
pkgdesc="System monitor package for GTK2"
arch=('x86_64')
url="http://gkrellm.srcbox.net/"
license=('GPL-3.0-or-later')
depends=('gtk2' 'libsm' 'lm_sensors')
makedepends=('gettext')
backup=('etc/gkrellmd.conf')
source=("${url}/releases/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('68c75a03a06b935afa93d3331ca1c2d862c1d50c3e9df19d9a8d48970d766b55')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make LOCALEDIR=/usr/share/locale
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" \
    SERVICE_DIR="$pkgdir"/usr/lib/systemd/system \
    CFGDIR=/etc \
    PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
