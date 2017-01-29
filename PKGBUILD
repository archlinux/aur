# Maintainer: Muhammad Yahya Harlan <muhammad.harlan@binus.ac.id>

pkgname=decklink-sdk
pkgver=10.8.3
pkgrel=1
epoch=1
pkgdesc="Blackmagic Design DeckLink SDK"
arch=('i686' 'x86_64')
url="https://www.blackmagicdesign.com/support/family/capture-and-playback"
license=('custom')
depends=('glu' 'mesa' 'qt4')
makedepends=('unzip')
options=('!strip')
source=("local://Blackmagic_DeckLink_SDK_${pkgver}.zip")
sha256sums=('be6e582c878ce6abc7faa03085d1715b45d83c2cc4e7717b0f05cf01dffb8445')

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
