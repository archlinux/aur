
  pkgname=ferrumpix-bin
  pkgver=0.9.1
  pkgrel=1
  pkgdesc='Desktop photo manager and image editor built with Avalonia UI'
  arch=('x86_64')
  url='https://github.com/Bitpainter75/FerrumPix'
  license=('GPL-3.0-only')
  depends=('glibc' 'zlib' 'fontconfig' 'freetype2' 'libx11' 'libxcb' 'libxkbcommon' 'libice' 'libsm' 'vlc')
  provides=('ferrumpix')
  conflicts=('ferrumpix')
  source=("https://github.com/Bitpainter75/FerrumPix/releases/download/v${pkgver}/FerrumPix-${pkgver}-linux-x64.zip"
          "io.github.Bitpainter75.FerrumPix.desktop::https://raw.githubusercontent.com/Bitpainter75/FerrumPix/${pkgver}/packaging/io.github.Bitpainter75.FerrumPix.desktop"
          "io.github.Bitpainter75.FerrumPix.png::https://raw.githubusercontent.com/Bitpainter75/FerrumPix/${pkgver}/Assets/FerrumPix_Icon.png"
          "LICENSE::https://raw.githubusercontent.com/Bitpainter75/FerrumPix/v${pkgver}/LICENSE")
  sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

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
