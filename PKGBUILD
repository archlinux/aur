# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Matt Smith (Majik) <darkknight@helpdesk.zaz.net>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jozef Riha <jose1711@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
pkgname=gkrellm
pkgver=2.3.5
pkgrel=2
pkgdesc="System monitor package for GTK2"
arch=('x86_64' 'i686')
url="http://members.dslextreme.com/users/billw/gkrellm/gkrellm.html"
license=('GPL3')
if [ "$CARCH" = "i686" ]
then
  depends=('lib32-gtk2' 'lib32-libsm' 'lm_sensors')
else
  depends=('gtk2' 'libsm' 'lm_sensors')
fi

makedepends=('gettext')
backup=('etc/gkrellmd.conf')
source=("http://members.dslextreme.com/users/billw/$pkgname/$pkgname-$pkgver.tar.bz2"
        "gkrellmd")
sha256sums=('702b5b0e9c040eb3af8e157453f38dd6f53e1dcd8b1272d20266cda3d4372c8b'
            'c6d532dd7a706891aed92d750bceda74d4618e86ad82feadc0503214de904360')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make LOCALEDIR=/usr/share/locale
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 "server/gkrellmd.conf" "$pkgdir/etc/gkrellmd.conf"
  install -Dm755 "../gkrellmd" "$pkgdir/etc/rc.d/gkrellmd"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
