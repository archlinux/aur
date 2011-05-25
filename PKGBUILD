# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=decklink-sdk
pkgver=8.0
pkgrel=1
pkgdesc="BlackMagic Design DeckLink SDK"
arch=('i686' 'x86_64')
url="http://www.blackmagic-design.com/support/sdks/"
license=('custom')
depends=('decklink' 'gcc-libs' 'mesa' 'qt')
options=(!strip)
source=("http://www.blackmagic-design.com/media/983433/decklink_sdk_$pkgver.zip")
sha256sums=('4462f0bb83a549f34d4c0a3a65b3751de905b608ab5b8f7e0597626d74e47c0a')

package() {
  mkdir -p "$pkgdir/usr/src" "$pkgdir/usr/bin"
  cp -a "$srcdir/Blackmagic DeckLink SDK $pkgver/Linux/include" "$pkgdir/usr/src/decklink-sdk"
  [ "$CARCH" = "i686" ] && arch='i386'
  [ "$CARCH" = "x86_64" ] && arch='x86_64'
  for util in Capture DeviceList OpenGLOutput SignalGenerator TestPattern
  do
    install -D -m 0755 "$srcdir/Blackmagic DeckLink SDK $pkgver/Linux/Samples/bin/$arch/$util" "$pkgdir/usr/bin/$util"
  done
}

# vim:set ts=2 sw=2 et:
