# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=decklink-sdk
pkgver=10.5
pkgrel=1
epoch=1
pkgdesc="Blackmagic Design DeckLink SDK"
arch=('i686' 'x86_64')
url="https://www.blackmagicdesign.com/support/family/capture-and-playback"
license=('custom')
depends=('glu' 'mesa' 'qt4')
makedepends=('unzip')
options=('!strip')
source=("file://Blackmagic_DeckLink_SDK_${pkgver}.zip")
sha256sums=('d99a1e5ad300dc1ea5b267dd319c497d946664afe3cd2058dbaa79743dc52d28')

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
