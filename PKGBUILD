
  pkgname=ferrumpix-bin
  pkgver=0.9.1
  pkgrel=1
  pkgdesc='Desktop photo manager and image editor built with Avalonia UI'
  arch=('x86_64')
  url='https://github.com/Bitpainter75/FerrumPix'
  license=('GPL-3.0-only')
  depends=('glibc' 'zlib' 'fontconfig' 'freetype2' 'libx11' 'libxcb' 'libxkbcommon' 'libice' 'libsm')
  optdepends=('vlc: video thumbnails and playback')
  provides=('ferrumpix')
  conflicts=('ferrumpix')

  source=("https://github.com/Bitpainter75/FerrumPix/releases/download/${pkgver}/FerrumPix-${pkgver}-linux-x64.zip"
          "io.github.Bitpainter75.FerrumPix.desktop"
          "io.github.Bitpainter75.FerrumPix.png"
          "LICENSE")
sha256sums=('323e7a9c94eeb09e7d86c2b126fc7690c592a753c962e7dccac00872790b2bfa'
            '02a23d27b0ea478bc951de3baebc4b30ec303f679fb137322fdf56b957104321'
            'c621a95fca97c22495bb05ae9753391c5523ac0fce8f16f64b3713515e664067'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

  package() {
    install -dm755 "$pkgdir/opt/ferrumpix"
    cp -a "$srcdir"/* "$pkgdir/opt/ferrumpix/"

    rm -f "$pkgdir/opt/ferrumpix/"{*.desktop,*.png,LICENSE}
    chmod +x "$pkgdir/opt/ferrumpix/FerrumPix"

    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/ferrumpix/FerrumPix "$pkgdir/usr/bin/ferrumpix"

    install -Dm644 "$srcdir/io.github.Bitpainter75.FerrumPix.desktop" \
      "$pkgdir/usr/share/applications/io.github.Bitpainter75.FerrumPix.desktop"

    install -Dm644 "$srcdir/io.github.Bitpainter75.FerrumPix.png" \
      "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.Bitpainter75.FerrumPix.png"

    install -Dm644 "$srcdir/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  }
