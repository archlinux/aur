
  pkgname=ferrumpix-bin
  pkgver=0.9.48
  pkgrel=4
  pkgdesc='Desktop Photo/RAW-Editor, Viewer, Gallery, Immich and Nextcloud Client in one App'
  arch=('x86_64')
  url='https://github.com/Bitpainter75/FerrumPix'
  license=('GPL-3.0-only')
  depends=('glibc' 'zlib' 'fontconfig' 'freetype2' 'libx11' 'libxcb' 'libxkbcommon' 'libice' 'libsm'
           'mpv' 'libraw')
  optdepends=('libheif: read HEIC, HEIF and AVIF files'
              'libjxl: read and write JPEG XL files'
              'dnglab: convert RAW files to DNG')
  provides=('ferrumpix')
  conflicts=('ferrumpix')
  options=('!strip')

  source=("FerrumPix-${pkgver}-${pkgrel}-linux-x64-aur.zip::https://github.com/Bitpainter75/FerrumPix/releases/download/${pkgver}/FerrumPix-${pkgver}-${pkgrel}-linux-x64-aur.zip"
          "io.github.Bitpainter75.FerrumPix.desktop"
          "io.github.Bitpainter75.FerrumPix.png")
  noextract=("FerrumPix-${pkgver}-${pkgrel}-linux-x64-aur.zip")
sha256sums=('3aaa1dd4a955a3707321fb6f6186c74a56d5815cce24e0ae4ef14cb3ae1e177a'
            'e2b596afb3471c36194d50905f0f158f03dd340fcf0f788668bf37204eb7c2ec'
            'a674c4fd6cf2221a4b8a5d29922ce0a17ab4aa7ffdc7a4976e781bc9ebf194eb')

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
