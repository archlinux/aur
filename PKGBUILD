# Maintainer: Jonian Guveli <jonian@hardpixel.eu>

pkgname="insomnium-bin"
pkgver=0.2.0
pkgrel=1
pkgdesc="API Client and Design Platform for GraphQL and REST (Privacy focused Insomnia fork)"
arch=("x86_64")
url="https://github.com/ArchGPT/insomnium"
license=("MIT")
depends=("libxss" "nss" "gtk3" "alsa-lib")
optdepends=(
  "libappindicator-gtk3: StatusNotifierItem support"
  "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)"
)
provides=("insomnium")
conflicts=("insomnium" "insomnium-git")
source=("insomnium-${pkgver}.deb::$url/releases/download/core@${pkgver}/Insomnium.Core-${pkgver}.deb")
sha256sums=('971f1bb71a9b0f6e80b8fdb6d3b33cfdfaa2451b95473ae7ed3d9ab4e668e59f')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"

  rm -rf "$pkgdir/usr/share/doc"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"

  mv "$pkgdir/usr/share/applications/insomnia.desktop" "$pkgdir/usr/share/applications/insomnium.desktop"
  mv "$pkgdir/usr/share/icons/hicolor/0x0/apps/insomnia.png" "$pkgdir/usr/share/icons/hicolor/scalable/apps/insomnium.png"

  sed -i -e "s/Icon=insomnia/Icon=insomnium/g" "$pkgdir/usr/share/applications/insomnium.desktop"

  mkdir -p "$pkgdir/usr/bin"
  ln -sf "/opt/Insomnium/insomnia" "$pkgdir/usr/bin/insomnium"
}
