# Maintainer:  LIN Ruohshoei  <20455421+LinRs at users.noreply.github dot com>

pkgname=libbassmidi
pkgver=2.4.15
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
sha512sums=('5b5e3cc1e07b4a06160d11ec7a8d93473d494511e4d81cc4a4bc501da9a671076fa68795979f8777cd31a603ab6504f7a87c5fc88ba13dba0e6ee4b9bf46cd35'
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
