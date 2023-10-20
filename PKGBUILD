# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=mrvn-radiant
pkgname=$_pkgname-bin
pkgver=2023.09.25.d51258c
pkgrel=2
pkgdesc="MRVN-Radiant is a fork of netradiant-custom modified for Titanfall and Apex Legends mapping (binary release)"
arch=('x86_64')
url="https://github.com/MRVN-Radiant/MRVN-Radiant"
license=('BSD' 'LGPL' 'GPL')
depends=('qt5-base' 'hicolor-icon-theme' 'libpng')
provides=($_pkgname)
conflicts=($_pkgname)
noextract=("MRVN-Radiant_2023-09-25_d51258c_Linux_x86_64.zip")
_actions=6294543226
_number=2023-09-25_d51258c
source=("https://nightly.link/MRVN-Radiant/MRVN-Radiant/actions/runs/$_actions/MRVN-Radiant_${_number}_Linux_x86_64.zip"
        "https://github.com/MRVN-Radiant/MRVN-Radiant/raw/main/LICENSE")
sha256sums=('a44a7c0b9c1a6e280b4dd07b5717b960978acc5a61d3e1459a6cc5bbc4a5559d'
            'f8734393be36c49306d16855268f98c8ef17e09e6b384a3190805f7ff450c871')

prepare() {
  # Create a shortcut
  echo "Categories=Utilities;" > desktop
  sed -i '1 i\Comment=Fork of netradiant-custom modified for Titanfall and Apex Legends mapping' desktop
  sed -i '1 i\Icon=mrvn-radiant' desktop
  sed -i '1 i\Type=Application' desktop
  sed -i '1 i\Terminal=false' desktop
  sed -i '1 i\Exec=mrvn-radiant %U' desktop
  sed -i '1 i\Name=MRVN Radiant' desktop
  sed -i '1 i\[Desktop Entry]' desktop
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
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/mrvn-radiant.png"
  install -Dm644 logo.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/mrvn-radiant.png"
  install -Dm644 splash.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/mrvn-radiant.png"
}
