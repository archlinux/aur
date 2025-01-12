# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=uncso2-bin
pkgver=2.1.0
pkgrel=1
pkgdesc='A file extractor for Counter-Strike: Online 2 and Titanfall Online (binary release)'
url="https://github.com/harmonytf/UnCSO2"
license=('GPL-3.0-only')
arch=('x86_64')
depends=('libuncso2' 'qt6-base')
provides=("uncso2")
conflicts=("uncso2")
_appimage=UnCSO2-$pkgver-linux64_gcc.AppImage
source=("$url/releases/download/v$pkgver/$_appimage"
        "$url/raw/refs/tags/v2.1.0/resources/uncso2.svg")
sha256sums=('89d40523149cc1a7c74f13c4192c9841b86fe3a4acaf9049c27bf65edd1b176f'
            'c3f8e700a18aa951701e50c33556740574d04bcfbfd31e9eb9083b34d44c107f')

prepare() {
# Extract the AppImage
  chmod +x "./$_appimage"
  "./$_appimage" --appimage-extract
# Edit the shortcut
  mv squashfs-root/UnCSO2.desktop uncso2.desktop
  sed -i -E "s|Icon=UnCSO2|Icon=uncso2|g" uncso2.desktop
}

package() {
  install -Dm644 uncso2.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 uncso2.desktop -t "$pkgdir/usr/share/applications"
  cd squashfs-root
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/uncso2"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/uncso2"
  install -Dm644 UnCSO2.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/uncso2.png"
  install -Dm755 uc2 -t "$pkgdir/usr/bin"
  ln -s /usr/bin/uc2 "$pkgdir/usr/bin/uncso2"
}
