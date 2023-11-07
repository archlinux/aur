# Maintainer: Jonian Guveli <jonian@hardpixel.eu>

pkgname="insomnium-bin"
pkgver=0.2.3
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
source=("insomnium-${pkgver}.deb::$url/releases/download/core@${pkgver}-a/Insomnium.Core-${pkgver}-a.deb")
sha256sums=('88aaae9be568a7eab0cb51031698b6b5781ef9f98446d3b09d99578cfa54f00b')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"

  rm -rf "$pkgdir/usr/share/doc"
  mkdir -p "$pkgdir/usr/bin"

  ln -sf "/opt/Insomnium/insomnium" "$pkgdir/usr/bin/insomnium"
}
