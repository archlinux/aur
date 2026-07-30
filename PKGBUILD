# Maintainer: Evilleader evilleader91@gmail.com

pkgname=steamidra-bin
pkgver=6.5.5
pkgrel=1
pkgdesc="Advanced Steam game management tool with manifest handling, Lua integrations, backups, fixes, and GUI"
arch=('x86_64')
url="https://github.com/Midrags/SFF"
license=('GPL3')
depends=(
  'gtk3'
  'nss'
  'alsa-lib'
)
provides=('steamidra')
conflicts=('steamidra')

source=(
  "SteaMidra-${pkgver}-linux.zip::https://github.com/Midrags/SFF/releases/download/v${pkgver}/SteaMidra-${pkgver}-linux.zip"
)

noextract=("SteaMidra-${pkgver}-linux.zip")

sha256sums=('e7a2bce9f1d855720bee59f33fb089dd03dc6513115133e2debe7db9976c8e4f')


package() {

  mkdir -p "$pkgdir/opt/steamidra"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"

  bsdtar -xf "SteaMidra-${pkgver}-linux.zip" \
    -C "$pkgdir/opt/steamidra"


  cat > "$pkgdir/usr/bin/steamidra" << 'EOF'
#!/bin/bash
exec /opt/steamidra/SteaMidra "$@"
EOF

  chmod +x "$pkgdir/usr/bin/steamidra"


  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/applications/steamidra.desktop" << 'EOF'
[Desktop Entry]
Name=SteaMidra
GenericName=Steam utility
Exec=/usr/bin/steamidra
Terminal=false
Type=Application
Categories=Utility;Game;
Comment=SteaMidra Steam utility
EOF

}

