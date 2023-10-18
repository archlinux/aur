# Maintainer: alyrow

pkgname=hyperlap2d-bin
pkgver=0.1.2
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
sha512sums=('a3eb2839c169020ac2323b3bec3241029a5fceedc87c38e441027ce847fe1512350dbec0b5a01ba7ff2afd290cc366636d78a00dbdaef28687e9c2828682e8fe')

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
