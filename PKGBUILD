# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=mrvn-radiant
pkgname=$_pkgname-bin
pkgver=0.0
pkgrel=1
pkgdesc="MRVN-Radiant is a fork of netradiant-custom modified for Titanfall and Apex Legends mapping (binary release)"
arch=('x86_64')
url="https://github.com/MRVN-Radiant/MRVN-Radiant"
license=('BSD' 'GPL' 'LGPL')
provides=($_pkgname)
conflicts=($_pkgname)
noextract=("$_pkgname-$pkgver-$pkgrel.zip")
_actions=5231536939
_number=2023-06-10_5f02305
source=("$_pkgname-$pkgver-$pkgrel.zip::https://nightly.link/MRVN-Radiant/MRVN-Radiant/actions/runs/$_actions/MRVN-Radiant_${_number}_Linux_x86_64.zip")
sha256sums=('1949f665f5af7cf5fd74973f5d2bb12f4d931b31eb9111d39bbcd73330407f68')

prepare() {
  # Create a shortcut
  echo "Categories=Utilities;" > desktop
  sed -i '1 i\Comment=Fork of netradiant-custom modified for Titanfall and Apex Legends mapping' desktop
  sed -i '1 i\Icon=/opt/MRVN-Radiant/bitmaps/splash.png' desktop
  sed -i '1 i\Type=Application' desktop
  sed -i '1 i\Terminal=false' desktop
  sed -i '1 i\Exec=mrvn-radiant %U' desktop
  sed -i '1 i\Name=MRVN Radiant' desktop
  sed -i '1 i\[Desktop Entry]' desktop
  mv desktop $_pkgname.desktop
  # Unzip
  unzip -od $_pkgname-$pkgver-$pkgrel $_pkgname-$pkgver-$pkgrel.zip
  # Make the binary executable
  chmod +x $_pkgname-$pkgver-$pkgrel/radiant
}

package() {
  # Create folders
  mkdir -p "$pkgdir/opt/MRVN-Radiant" "$pkgdir/usr/bin"
  # Install
  mv $_pkgname-$pkgver-$pkgrel/* "$pkgdir/opt/MRVN-Radiant"
  ln -s /opt/MRVN-Radiant/radiant "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
}
