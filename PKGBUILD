# Maintainer: alyrow

pkgname=hyperlap2d-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A powerful, platform-independent, visual editor for complex 2D worlds and scenes."
arch=('x86_64')
url="https://hyperlap2d.rednblack.games/"
license=('GPL3')
conflicts=("hyperlap2d-git")
provides=("hyperlap2d")
depends=('libxtst' 'libxrender' 'alsa-lib' 'hicolor-icon-theme' 'libnet' 'java-runtime')
makedepends=('binutils' 'tar')
optdepends=()
source=("$pkgname-$pkgver.deb::https://github.com/rednblackgames/HyperLap2D/releases/download/v${pkgver}/Linux.hyperlap2d_${pkgver}-1_amd64.deb")
sha512sums=('e1a7df96e2150ea27a2f0131e155d4cb8c0a77819576564db6dbd580231e1137c53b3b67bf059e3f4b7d70d7f312e3543b552bbc9843a12a1be34ae4068cb46f')

build() {
  ar xv ${pkgname}-${pkgver}.deb
  tar -xvf data.tar.zst
}

package() {
  mkdir -p "${pkgdir}/opt/hyperlap2d/"
  cp -R "${srcdir}/opt" "${pkgdir}"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/hyperlap2d/bin/HyperLap2D" "${pkgdir}/usr/bin/hyperlap2d"

  install -Dm644 "${srcdir}/opt/hyperlap2d/lib/hyperlap2d-HyperLap2D.desktop" "${pkgdir}/usr/share/applications/hyperlap2d-HyperLap2D.desktop"
  install -Dm644 "${srcdir}/opt/hyperlap2d/lib/HyperLap2D.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/HyperLap2D.png"
}
