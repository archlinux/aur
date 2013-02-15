# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=decklink-sdk
pkgver=9.7
pkgrel=1
epoch=1
pkgdesc="Blackmagic Design DeckLink SDK"
arch=('i686' 'x86_64')
url="http://www.blackmagic-design.com/support/sdks/"
license=('custom')
depends=('mesa' 'qt')
makedepends=('unzip')
options=('!strip')
source=("http://software.blackmagicdesign.com/SDK/Blackmagic_DeckLink_SDK_${pkgver}.zip")
noextract=("Blackmagic_DeckLink_SDK_$pkgver.zip")
sha256sums=('5eb99dd86ff88b33533db8622b32fed10fd8ff941bbb73fc2d2f1c4297ad696a')

package() {
  cd "$srcdir"
  unzip -o "Blackmagic_DeckLink_SDK_$pkgver.zip"

  mkdir -p "$pkgdir/usr/src" "$pkgdir/usr/bin"
  cp -a "$srcdir/Blackmagic DeckLink SDK $pkgver/Linux/include" "$pkgdir/usr/src/decklink-sdk"
  [ "$CARCH" = "i686" ] && _arch='i386'
  [ "$CARCH" = "x86_64" ] && _arch='x86_64'
  cd "$srcdir/Blackmagic DeckLink SDK $pkgver/Linux/Samples/bin/${_arch}"
  for util in Capture DeviceList LoopThroughWithOpenGLCompositing OpenGLOutput SignalGenerator TestPattern
  do
    install -D $util "$pkgdir/usr/bin/$util"
  done
}

# vim:set ts=2 sw=2 et:
