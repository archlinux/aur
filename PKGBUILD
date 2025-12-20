# Maintainer: Jackson Yarger <jacksonkyarger@gmail.com>

pkgname=zoo-design-studio-bin
_pkgname=zoo-design-studio
pkgver=1.1.3
pkgrel=1
pkgdesc="Zoo Design Studio CAD application (AppImage)"
arch=('x86_64')
url="https://github.com/KittyCAD/modeling-app"
license=('custom')
depends=('fuse2')
options=('!strip')

source=(
  "Zoo.Design.Studio-${pkgver}.AppImage::https://github.com/KittyCAD/modeling-app/releases/download/v${pkgver}/Zoo.Design.Studio-${pkgver}-x86_64-linux.AppImage"
)

sha256sums=(
  '700852f5453c7e4b5726f54375490558acb6726bcab2ee68a7619e13adece3e9'
)

package() {
  install -dm755 "$pkgdir/opt/$_pkgname"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"

  install -m755 \
    "$srcdir/Zoo.Design.Studio-${pkgver}.AppImage" \
    "$pkgdir/opt/$_pkgname/$_pkgname.AppImage"

  # Wrapper
  cat > "$pkgdir/usr/bin/$_pkgname" <<EOF
#!/bin/sh
exec /opt/$_pkgname/$_pkgname.AppImage "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$_pkgname"

  # Desktop entry
  cat > "$pkgdir/usr/share/applications/$_pkgname.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Zoo Design Studio
Exec=$_pkgname
Icon=$_pkgname
Categories=Graphics;Engineering;3DGraphics;
Terminal=false
EOF
}
