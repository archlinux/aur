
  pkgname=ferrumpix-bin
  pkgver=0.9.38
  pkgrel=2
  pkgdesc='Desktop Photo/RAW-Editor, Viewer, Gallery, Immich and Nextcloud Client in one App'
  arch=('x86_64')
  url='https://github.com/Bitpainter75/FerrumPix'
  license=('GPL-3.0-only')
  depends=('glibc' 'zlib' 'fontconfig' 'freetype2' 'libx11' 'libxcb' 'libxkbcommon' 'libice' 'libsm'
           'mpv' 'libraw')
  optdepends=('libheif: HEIC/HEIF/AVIF-Dateien lesen')
  provides=('ferrumpix')
  conflicts=('ferrumpix')
  options=('!strip')

  source=("FerrumPix-${pkgver}-${pkgrel}-linux-x64-aur.zip::https://github.com/Bitpainter75/FerrumPix/releases/download/${pkgver}/FerrumPix-${pkgver}-${pkgrel}-linux-x64-aur.zip"
          "io.github.Bitpainter75.FerrumPix.desktop"
          "io.github.Bitpainter75.FerrumPix.png")
  noextract=("FerrumPix-${pkgver}-${pkgrel}-linux-x64-aur.zip")
sha256sums=('695fd3869fc4abb87bbdc3d291edc907580376f06f8ef33a63591e512c2020df'
            'baab02ecaff9a6db980340f351bbc2507a000cb0d29fd0ee1584499092fdcc92'
            'cc691f466e28f2c57d18598553c26b04da22d8f6baadc2d7bb33504cdb2a20dc')

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
