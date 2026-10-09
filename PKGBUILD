# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.
pkgname=gophie-bin
pkgver=1.1
pkgrel=1
pkgdesc="A modern Gopher client (prebuilt Linux binary)"
arch=('x86_64')
url="https://github.com/jankammerath/gophie"
license=('BSD-3-Clause')
depends=('gtk3' 'glib2' 'cairo' 'pango' 'gdk-pixbuf2' 'libx11')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}-linux.tar.gz::https://github.com/jankammerath/gophie/releases/download/${pkgver}/Gophie-${pkgver}-Linux.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/jankammerath/gophie/${pkgver}/LICENSE")
sha256sums=('a2376776009a99b8592a94db705c433fd3a8d451923bb6a4f5c90ee5d33cf5a7'
            '8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b')
prepare() {
  cd "${srcdir}"
  curl -sL -o gophie.png https://raw.githubusercontent.com/jankammerath/gophie/master/res/icon.png
  cat > gophie.desktop << 'DESK'
[Desktop Entry]
Type=Application
Name=Gophie
Comment=Gopher client
Exec=gophie
Icon=gophie
Terminal=false
Categories=Network;FileTransfer;
StartupNotify=true
DESK
}
package() {
  cd "${srcdir}"
  install -Dm755 "Gophie" "${pkgdir}/usr/bin/gophie"
  install -Dm644 "${srcdir}/gophie.desktop" "${pkgdir}/usr/share/applications/gophie.desktop"
  install -Dm644 "${srcdir}/gophie.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gophie.png"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
