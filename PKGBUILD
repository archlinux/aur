# Maintainer: Jonian Guveli <jonian@hardpixel.eu>

pkgname="insomnium-bin"
pkgver=0.1.1
pkgrel=1
pkgdesc="API Client and Design Platform for GraphQL and REST"
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
source=(
  "insomnium-${pkgver}.deb::$url/releases/download/v${pkgver}a/Insomnium.ubuntu-v${pkgver}.deb"
  "insomnia.svg"
)
sha256sums=(
  '00de1dc4e0e35527391178cf44cd736198914cf0e70658d5c73e13a16bc4e067'
  '1ef035acb2f4ae1f6665cdcb03514cd3ef51d254365a85caa8cc4f81d7e821f3'
)

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"

  rm -rf "$pkgdir/usr/share/doc"
  rm -rf "$pkgdir/usr/share/icons"

  mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  cp "insomnia.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/insomnia.svg"
  mv "$pkgdir/usr/share/applications/insomnia.desktop" "$pkgdir/usr/share/applications/insomnium.desktop"

  mkdir -p "$pkgdir/usr/bin"
  ln -sf "/opt/Insomnium/insomnia" "$pkgdir/usr/bin/insomnium"
}
