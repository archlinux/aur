
  pkgname=ferrumpix-bin
  pkgver=0.9.44
  pkgrel=2
  pkgdesc='Desktop Photo/RAW-Editor, Viewer, Gallery, Immich and Nextcloud Client in one App'
  arch=('x86_64')
  url='https://github.com/Bitpainter75/FerrumPix'
  license=('GPL-3.0-only')
  depends=('glibc' 'zlib' 'fontconfig' 'freetype2' 'libx11' 'libxcb' 'libxkbcommon' 'libice' 'libsm'
           'mpv' 'libraw')
  optdepends=('libheif: HEIC/HEIF/AVIF-Dateien lesen'
              'dnglab: RAW-Dateien in DNG umwandeln')
  provides=('ferrumpix')
  conflicts=('ferrumpix')
  options=('!strip')

  source=("FerrumPix-${pkgver}-${pkgrel}-linux-x64-aur.zip::https://github.com/Bitpainter75/FerrumPix/releases/download/${pkgver}/FerrumPix-${pkgver}-${pkgrel}-linux-x64-aur.zip"
          "io.github.Bitpainter75.FerrumPix.desktop"
          "io.github.Bitpainter75.FerrumPix.png")
  noextract=("FerrumPix-${pkgver}-${pkgrel}-linux-x64-aur.zip")
sha256sums=('131b82ccaeeac97c9233b0f036f719723644ab24644a2c95dfad24c3520a9a33'
            'baab02ecaff9a6db980340f351bbc2507a000cb0d29fd0ee1584499092fdcc92'
            'd757e74c2b4aa5d8bfa760d443c4ed8c9ff978e0504602ced5e5c5c5c316b15f')

  prepare() {
    rm -rf "$srcdir/FerrumPix-${pkgver}"
    mkdir -p "$srcdir/FerrumPix-${pkgver}"
    bsdtar -xf "$srcdir/FerrumPix-${pkgver}-${pkgrel}-linux-x64-aur.zip" -C "$srcdir/FerrumPix-${pkgver}"
  }

  package() {
    install -dm755 "$pkgdir/opt/ferrumpix"
    cp -a "$srcdir/FerrumPix-${pkgver}/." "$pkgdir/opt/ferrumpix/"

    install -Dm644 "$pkgdir/opt/ferrumpix/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    if [ -f "$pkgdir/opt/ferrumpix/THIRD-PARTY-NOTICES.txt" ]; then
      install -Dm644 "$pkgdir/opt/ferrumpix/THIRD-PARTY-NOTICES.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.txt"
    fi
    rm -f "$pkgdir/opt/ferrumpix/"{*.desktop,*.png}
    chmod +x "$pkgdir/opt/ferrumpix/FerrumPix"

    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/ferrumpix/FerrumPix "$pkgdir/usr/bin/ferrumpix"

    install -Dm644 "$srcdir/io.github.Bitpainter75.FerrumPix.desktop" \
      "$pkgdir/usr/share/applications/io.github.Bitpainter75.FerrumPix.desktop"

    install -Dm644 "$srcdir/io.github.Bitpainter75.FerrumPix.png" \
      "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.Bitpainter75.FerrumPix.png"
  }
