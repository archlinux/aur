# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=mrvn-radiant
pkgname=$_pkgname-bin
pkgver=2024.04.06.d98b662
pkgrel=1
pkgdesc="MRVN-Radiant is a fork of netradiant-custom modified for Titanfall and Apex Legends mapping (binary release)"
url="https://github.com/MRVN-Radiant/MRVN-Radiant"
license=('BSD-3-Clause-Modification' 'LGPL-2.1-only' 'GPL-2.0-only')
arch=('x86_64')
depends=('qt5-base' 'hicolor-icon-theme' 'libpng')
provides=("$_pkgname")
conflicts=("$_pkgname")
_actions=8577693619
_number=2024-04-06_d98b662
noextract=("MRVN-Radiant_${_number}_Linux_x86_64.zip")
source=("https://nightly.link/MRVN-Radiant/MRVN-Radiant/actions/runs/$_actions/MRVN-Radiant_${_number}_Linux_x86_64.zip"
        "https://github.com/MRVN-Radiant/MRVN-Radiant/raw/main/GPL"
        "https://github.com/MRVN-Radiant/MRVN-Radiant/raw/main/LGPL"
        "https://github.com/MRVN-Radiant/MRVN-Radiant/raw/main/LICENSE")
sha256sums=('9e78999ff771192cb5794748643a0f6b72b7fe8237a2521d22843953df743beb'
            'e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4'
            'eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449'
            'f8734393be36c49306d16855268f98c8ef17e09e6b384a3190805f7ff450c871')

prepare() {
# Create a shortcut
  echo -e "[Desktop Entry]\n\
Name=MRVN Radiant\n\
Exec=$_pkgname %U\n\
Icon=$_pkgname\n\
Terminal=false\n\
Type=Application\n\
Comment=Fork of netradiant-custom modified for Titanfall and Apex Legends mapping\n\
Categories=Utilities;" > $_pkgname.desktop
# Unzip
  unzip -od $_pkgname-$pkgver MRVN-Radiant_${_number}_Linux_x86_64.zip
# Make the binary executable
  chmod +x $_pkgname-$pkgver/radiant
}

package() {
# Create directories
  mkdir -p "$pkgdir/opt/MRVN-Radiant" "$pkgdir/usr/bin"
# Install
  cd $_pkgname-$pkgver/bitmaps
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
  install -Dm644 logo.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  install -Dm644 splash.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  cd "$srcdir"
  install -Dm644 GPL LGPL LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  mv $_pkgname-$pkgver/* "$pkgdir/opt/MRVN-Radiant"
  ln -s /opt/MRVN-Radiant/radiant "$pkgdir/usr/bin/$_pkgname"
}
