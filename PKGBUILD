# Maintainer: alyrow

pkgname=hyperlap2d-bin
pkgver=0.0.8
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
source=("$pkgname-$pkgver.deb::https://github.com/rednblackgames/HyperLap2D/releases/download/v${pkgver}/hyperlap2d_${pkgver}-1_amd64.deb")
sha512sums=('934aff574a2fdfb4265894812f57f6b88b5e8aa4c491617fe6ba6aebaaddcf0f00f38eb67ffc5b31464fe07113ed5f80c7fd0feef19ab403552724fe183c57a6')

build() {
  ar xv ${pkgname}-${pkgver}.deb
  tar -xvf data.tar.xz
}

package() {
  mkdir -p "${pkgdir}/opt/hyperlap2d/"
  cp -R "${srcdir}/opt" "${pkgdir}"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/hyperlap2d/bin/HyperLap2D" "${pkgdir}/usr/bin/hyperlap2d"

  install -Dm644 "${srcdir}/opt/hyperlap2d/lib/hyperlap2d-HyperLap2D.desktop" "${pkgdir}/usr/share/applications/hyperlap2d-HyperLap2D.desktop"
  install -Dm644 "${srcdir}/opt/hyperlap2d/lib/HyperLap2D.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/HyperLap2D.png"
}
