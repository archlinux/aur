# Maintainer: nezbednik <nezbedniklmao@gmail.com>
pkgname=customizemii-bin
pkgver=3.11
pkgrel=1
pkgdesc="a custom channel creator for the wii"
arch=("any")
url="https://code.google.com/archive/p/customizemii/"
license=("GPL3")
depends=("mono")
makedepends=("unrar")
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/customizemii/CustomizeMii%203.11.rar" "https://wiibrew.org/w/images/0/0d/CustomizeMii_Icon.png")
noextract=("CustomizeMii%203.11.rar")
sha256sums=("7e62e26f44933a071b0e30a2b21581dfdea0106011a680153ac13852aba1b919" "8e54152ac9c14192f02a6659183aa7c6196df88f5d2072fecba5d1fed5a0e458")
prepare() {
  mkdir "customizemii"
  unrar x "CustomizeMii%203.11.rar" -y -op "customizemii"
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  mkdir "$pkgdir/opt"
  mv "customizemii" "$pkgdir/opt"
  echo -e "#!/bin/sh
cd /opt/customizemii
mono CustomizeMii.exe" > "$pkgdir/usr/bin/customizemii"
  chmod 755 "$pkgdir/usr/bin/customizemii"
  echo -e "[Desktop Entry]
Encoding=UTF-8
Version=3.11
Type=Application
Terminal=false
Exec=/usr/bin/customizemii
Name=CustomizeMii
Comment=a custom channel creator for the wii
Icon=customizemii
Categories=AudioVideo;" > "$pkgdir/usr/share/applications/CustomizeMii.desktop"
  mv "CustomizeMii_Icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/customizemii.png"
}
