# Maintainer:  LIN Ruohshoei  <20455421+LinRs at users.noreply.github dot com>

pkgname=libbassmidi
pkgver=2.4.14
pkgrel=1
pkgdesc="An extension enabling the playback of MIDI files and custom event sequences."
arch=('i686' 'x86_64')
url="https://www.un4seen.com/bass.html#addons"
license=('custom:basslicence')
depends=('libbass')
makedepends=('unzip')
source=(
  "${pkgname}-${pkgver}.zip"::"https://www.un4seen.com/files/bassmidi24-linux.zip"
	"LICENSE"
)
sha512sums=(
  '270f9b310d4206c9f88ab17452b4df391c5d89cf21b5a677b74dad01bdfe0a3eb5c02f0dbf00e88e8ec18b6826180c7d9d0b68a9f37715891e00552281d18d48'
  '0010ec376b29b12c15ea182675dcec6fad3219abc605e8f7b14b5e05957e68ef6a87ab13b70ea5ba80b72f030185fdd426a6ffd90d0c1c6ab716a2f12c4056a9')
package() {
  mkdir -p "$pkgdir/usr/lib/"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  mkdir -p "$pkgdir/usr/include"
  cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
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
