# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Matt Smith (Majik) <darkknight@helpdesk.zaz.net>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jozef Riha <jose1711@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=gkrellm
pkgver=2.3.8
pkgrel=1
pkgdesc="System monitor package for GTK2"
arch=('x86_64' 'i686')
url="http://gkrellm.srcbox.net/"
license=('GPL3')
depends=('gtk2' 'libsm' 'lm_sensors')
makedepends=('gettext')
backup=('etc/gkrellmd.conf')
source=("${url}/releases/$pkgname-$pkgver.tar.bz2"
        "gkrellm.service")
sha256sums=('8064ec03ac151c22d716e08d09851102e9deeb2156a265d97f5cf7ad547fa9e3'
            '2829931127632d0391f6749024809594b78c138fe4f03c98cd65fdbd47cea376')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make LOCALEDIR=/usr/share/locale
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 "server/gkrellmd.conf" "$pkgdir/etc/gkrellmd.conf"
  install -Dm644 "../gkrellm.service" "$pkgdir/usr/lib/systemd/system/gkrellm.service"
}

# vim:set ts=2 sw=2 et:
