# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=decklink-sdk
pkgver=10.1.1
pkgrel=1
epoch=1
pkgdesc="Blackmagic Design DeckLink SDK"
arch=('i686' 'x86_64')
url="http://www.blackmagic-design.com/support/sdks/"
license=('custom')
depends=('glu' 'mesa' 'qt4')
makedepends=('unzip')
options=('!strip')
source=("http://software.blackmagicdesign.com/SDK/Blackmagic_DeckLink_SDK_${pkgver}.zip")
sha256sums=('72ba22362b94182e055200e3c577c196ded61eff20e8d6d2d756a76c79424405')

package() {
  cd "$srcdir"

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
