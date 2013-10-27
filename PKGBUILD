# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Matt Smith (Majik) <darkknight@helpdesk.zaz.net>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jozef Riha <jose1711@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=gkrellm
pkgver=2.3.5
pkgrel=5
pkgdesc="System monitor package for GTK2"
arch=('x86_64' 'i686')
url="http://members.dslextreme.com/users/billw/gkrellm/gkrellm.html"
license=('GPL3')
depends=('gtk2' 'libsm' 'lm_sensors')
makedepends=('gettext')
backup=('etc/gkrellmd.conf')
source=("http://members.dslextreme.com/users/billw/$pkgname/$pkgname-$pkgver.tar.bz2"
        "gkrellm.service")
sha256sums=('702b5b0e9c040eb3af8e157453f38dd6f53e1dcd8b1272d20266cda3d4372c8b'
            '2829931127632d0391f6749024809594b78c138fe4f03c98cd65fdbd47cea376')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make LOCALEDIR=/usr/share/locale SYS_LIBS+=-lgmodule-2.0
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 "server/gkrellmd.conf" "$pkgdir/etc/gkrellmd.conf"
  install -Dm644 "../gkrellm.service" "$pkgdir/usr/lib/systemd/system/gkrellm.service"
}

# vim:set ts=2 sw=2 et:
