
  pkgname=ferrumpix-bin
  pkgver=0.9.11
  pkgrel=1
  pkgdesc='Desktop photo manager and image editor built with Avalonia UI'
  arch=('x86_64')
  url='https://github.com/Bitpainter75/FerrumPix'
  license=('GPL-3.0-only')
  depends=('glibc' 'zlib' 'fontconfig' 'freetype2' 'libx11' 'libxcb' 'libxkbcommon' 'libice' 'libsm'
           'mpv' 'libraw')
  provides=('ferrumpix')
  conflicts=('ferrumpix')
  options=('!strip')

  source=("FerrumPix-${pkgver}-${pkgrel}-linux-x64-aur.zip::https://github.com/Bitpainter75/FerrumPix/releases/download/${pkgver}/FerrumPix-${pkgver}-${pkgrel}-linux-x64-aur.zip"
          "io.github.Bitpainter75.FerrumPix.desktop"
          "io.github.Bitpainter75.FerrumPix.png")
  noextract=("FerrumPix-${pkgver}-${pkgrel}-linux-x64-aur.zip")
sha256sums=('4da436b16e658027ee09c616e298909128a33b7fa269b46c9eb447ca04c7e139'
            '02a23d27b0ea478bc951de3baebc4b30ec303f679fb137322fdf56b957104321'
            'c621a95fca97c22495bb05ae9753391c5523ac0fce8f16f64b3713515e664067')

  prepare() {
    rm -rf "$srcdir/FerrumPix-${pkgver}"
    mkdir -p "$srcdir/FerrumPix-${pkgver}"
    bsdtar -xf "$srcdir/FerrumPix-${pkgver}-${pkgrel}-linux-x64-aur.zip" -C "$srcdir/FerrumPix-${pkgver}"
  }

  package() {
    install -dm755 "$pkgdir/opt/ferrumpix"
    cp -a "$srcdir/FerrumPix-${pkgver}/." "$pkgdir/opt/ferrumpix/"

    rm -f "$pkgdir/opt/ferrumpix/"{*.desktop,*.png,LICENSE}
    chmod +x "$pkgdir/opt/ferrumpix/FerrumPix"

    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/ferrumpix/FerrumPix "$pkgdir/usr/bin/ferrumpix"

    install -Dm644 "$srcdir/io.github.Bitpainter75.FerrumPix.desktop" \
      "$pkgdir/usr/share/applications/io.github.Bitpainter75.FerrumPix.desktop"

    install -Dm644 "$srcdir/io.github.Bitpainter75.FerrumPix.png" \
      "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.Bitpainter75.FerrumPix.png"
  }
