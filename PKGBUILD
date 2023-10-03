# Maintainer: Jonian Guveli <jonian@hardpixel.eu>

pkgname="insomnium-bin"
pkgver=0.1.3
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
source=(
  "insomnium-${pkgver}.deb::$url/releases/download/v${pkgver}/Insomnium.Core-${pkgver}-alpha.0.deb"
  "insomnia.svg"
)
sha256sums=(
  '28228c376517c26c86940d7ee59f0d8c05b69c5d9b6ed7ec7f95c9f2e6bcec32'
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
