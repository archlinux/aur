# Maintainer:  Ainola
# Contributor: Hugo Lobo

pkgname=binkplayer
pkgver=2.7f
pkgrel=1
pkgdesc="Bink Video Player"
url="http://www.radgametools.com/bnkmain.htm"
arch=('i686' 'x86_64')
depends=('libgl' 'openal')
depends_i686=('gcc-libs')
# AUR helpers get confused with cached versions if the file name never changes.
source=("BinkLinuxPlayer-$pkgver.7z"::"http://www.radgametools.com/down/Bink/BinkLinuxPlayer.7z"
        "x-binkvideo.xml"
        "$pkgname.desktop"
        "$pkgname.png")
sha256sums=('3361488940e0e6b92ff4ec47bd9283f676aa63a40ddaeb06998dc740a3187e83'
            '880fcb3a4435750a2990af7b38dc26d81170487ae3f8ecb526aad5a17673a454'
            '1e3ac358afeff5d0f87ae4430d4d5ec21b2d45f9ac6ae6340d14b1e4280c18e6'
            'db086749490f24bf3c736d75b4fb75a7c7bf5d7209b8f7b9394d6c59063c86c8')
license=('custom')

package() {
  if [[ "$CARCH" == "x86" ]]; then
    install -Dm755 "${srcdir}/BinkPlayer" "${pkgdir}/usr/bin/binkplayer"
  elif [[ "$CARCH" == "x86_64" ]]; then
    install -Dm755 "${srcdir}/BinkPlayer64" "${pkgdir}/usr/bin/binkplayer"
  fi

  # Desktop integration
  install -Dm644 "$srcdir/x-binkvideo.xml" \
                 "$pkgdir/usr/share/mime/video/x-binkvideo.xml"
  install -Dm644 "$srcdir/$pkgname.desktop" \
                 "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.png" \
                 "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim: et sw=2 ts=2
