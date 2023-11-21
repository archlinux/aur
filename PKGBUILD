# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=mrvn-radiant
pkgname=$_pkgname-bin
pkgver=2023.11.20.274c446
pkgrel=2
pkgdesc="MRVN-Radiant is a fork of netradiant-custom modified for Titanfall and Apex Legends mapping (binary release)"
url="https://github.com/MRVN-Radiant/MRVN-Radiant"
arch=('x86_64')
license=('BSD' 'LGPL' 'GPL')
depends=('qt5-base' 'hicolor-icon-theme' 'libpng')
provides=($_pkgname)
conflicts=($_pkgname)
noextract=("MRVN-Radiant_2023-09-25_d51258c_Linux_x86_64.zip")
_actions=6934178981
_number=2023-11-20_274c446
source=("https://nightly.link/MRVN-Radiant/MRVN-Radiant/actions/runs/$_actions/MRVN-Radiant_${_number}_Linux_x86_64.zip"
        "https://github.com/MRVN-Radiant/MRVN-Radiant/raw/main/LICENSE")
sha256sums=('695966c00b820e15639e96514b9c329f3556e1d9db8236e50c59ed246a76b058'
            'SKIP')

prepare() {
# Create a shortcut
  echo -e "[Desktop Entry]\n\
Name=MRVN Radiant\n\
Exec=$_pkgname %U\n\
Terminal=false\n\
Type=Application\n\
Icon=$_pkgname\n\
Comment=Fork of netradiant-custom modified for Titanfall and Apex Legends mapping\n\
Categories=Utilities;" > desktop
  mv desktop $_pkgname.desktop
# Unzip
  unzip -od $_pkgname-$pkgver MRVN-Radiant_${_number}_Linux_x86_64.zip
# Make the binary executable
  chmod +x $_pkgname-$pkgver/radiant
}

package() {
# Create folders
  mkdir -p "$pkgdir/opt/MRVN-Radiant" "$pkgdir/usr/bin"
# Install
  mv $_pkgname-$pkgver/* "$pkgdir/opt/MRVN-Radiant"
  ln -s /opt/MRVN-Radiant/radiant "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  cd "$pkgdir/opt/MRVN-Radiant/bitmaps"
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
  install -Dm644 logo.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  install -Dm644 splash.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
}
