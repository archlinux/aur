# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=decklink-sdk
pkgver=9.0
_dlid=2432866
pkgrel=1
pkgdesc="Blackmagic Design DeckLink SDK"
arch=('i686' 'x86_64')
url="http://www.blackmagic-design.com/support/sdks/"
license=('custom')
depends=('decklink' 'gcc-libs' 'mesa' 'qt')
makedepends=('unzip')
options=('!strip')
source=("http://www.blackmagic-design.com/media/${_dlid}/DeckLink_SDK_$pkgver.zip")
noextract=("DeckLink_SDK_$pkgver.zip")
sha256sums=('5b9bbc1e781235f5a071b014d2875ef3a2c94d410eb95f3983d90c9b397766b7')

package() {
  cd "$srcdir"
  unzip -o "DeckLink_SDK_$pkgver.zip"

  mkdir -p "$pkgdir/usr/src" "$pkgdir/usr/bin"
  cp -a "$srcdir/Blackmagic DeckLink SDK $pkgver/Linux/include" "$pkgdir/usr/src/decklink-sdk"
  [ "$CARCH" = "i686" ] && _arch='i386'
  [ "$CARCH" = "x86_64" ] && _arch='x86_64'
  cd "$srcdir/Blackmagic DeckLink SDK $pkgver/Linux/Samples/bin/${_arch}"
  for util in Capture DeviceList OpenGLOutput SignalGenerator TestPattern
  do
    install -D $util "$pkgdir/usr/bin/$util"
  done
}

# vim:set ts=2 sw=2 et:
