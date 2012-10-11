# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=decklink-sdk
pkgver=9.6.4
_dlid=4820025
pkgrel=1
pkgdesc="Blackmagic Design DeckLink SDK"
arch=('i686' 'x86_64')
url="http://www.blackmagic-design.com/support/sdks/"
license=('custom')
depends=('decklink' 'mesa' 'qt')
makedepends=('unzip')
options=('!strip')
source=("http://www.blackmagic-design.com/media/${_dlid}/Blackmagic_DeckLink_SDK_$pkgver.zip")
noextract=("Blackmagic_DeckLink_SDK_$pkgver.zip")
sha256sums=('78a9aedf59d80d2f9102f1c24dd8d764851006c1b3c988b12b1d7c8717f6413c')

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
