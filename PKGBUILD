# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=decklink-sdk
pkgver=9.1
_dlid=3225462
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
sha256sums=('f98573cb8210741d1bc5578403227a11b797b56f5ac0ed88b25cde1905e07313')

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
