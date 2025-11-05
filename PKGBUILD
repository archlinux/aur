# Maintainer:  LIN Ruohshoei  <20455421+LinRs at users.noreply.github dot com>

pkgname=libbassmidi
pkgver=2.4.15
pkgrel=2
pkgdesc="An extension enabling the playback of MIDI files and custom event sequences."
arch=('i686' 'x86_64')
url="https://www.un4seen.com/bass.html#addons"
license=('custom:basslicence')
depends=('libbass')
makedepends=('unzip')
source=(
  "${pkgname}-${pkgver}.zip"::"https://www.un4seen.com/files/bassmidi24-linux.zip"
	"LICENSE.bass"
)
sha512sums=('fc9fb0b950ac7c8fdc4ef729b221bcfa670d7e3238872f2cfe0592bfbbe39735fa91b52d3c37291ed91ef0912453762d00d489fb50083668c1f94b26bddc9ed9'
            '0010ec376b29b12c15ea182675dcec6fad3219abc605e8f7b14b5e05957e68ef6a87ab13b70ea5ba80b72f030185fdd426a6ffd90d0c1c6ab716a2f12c4056a9')
package() {
  mkdir -p "$pkgdir/usr/lib/"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  mkdir -p "$pkgdir/usr/include"
  cp "$srcdir/LICENSE.bass" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp "$srcdir/bassmidi.chm" "$pkgdir/usr/share/doc/$pkgname"
  #msg2 "  -> Installing program..."
  [ "$CARCH" == i686 ] && install -Dm755 "$srcdir/libs/x86/$pkgname.so" "$pkgdir/usr/lib/"
  [ "$CARCH" == x86_64 ] && install -Dm755 "$srcdir/libs/x86_64/$pkgname.so" "$pkgdir/usr/lib/"
  cp "$srcdir/bassmidi.h" "$pkgdir/usr/include"	# I assume this is where it goes...
  # and just in case...
  chmod -R 755 "$pkgdir/usr/lib/$pkgname.so"
  chmod -R 644 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chmod -R 644 "$pkgdir/usr/share/doc/$pkgname/bassmidi.chm"
  chmod -R 644 "$pkgdir/usr/include/bassmidi.h"
}

# vim: ts=2 sw=2 et:
