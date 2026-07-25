# Maintainer: Kaique Lopes Bazilio

pkgname=2d-mmo-launcher-bin
_pkgname=2d-mmo-launcher
pkgver=0.2.0
pkgrel=1

pkgdesc="Launcher extensível para instalar e executar MMORPGs 2D no Linux"
arch=("x86_64")
url="https://github.com/nkaique21/2D-MMO-Launcher"
license=("MIT")

depends=(
  "gtk3"
  "webkit2gtk-4.1"
  "hicolor-icon-theme"
)

provides=("2d-mmo-launcher")
conflicts=("2d-mmo-launcher")

options=("!strip")

source=(
  "${_pkgname}-${pkgver}.deb::https://github.com/nkaique21/2D-MMO-Launcher/releases/download/v${pkgver}/2D.MMO.Launcher_${pkgver}_amd64.deb"
  "LICENSE"
)

sha256sums=(
  "d4cc562eb0bccc552d8a20a14ef08babf4b911edfdc773ac7d0aa719415bcb5d"
  "64e587754d31b70490c7db78c3e934b3ad12b3829241741a139414c9c3f54705"
)

prepare() {
  bsdtar -xf "${_pkgname}-${pkgver}.deb"
  bsdtar -xf data.tar.gz
}

package() {
  cp -a usr "${pkgdir}/"

  install -Dm644 \
    "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
