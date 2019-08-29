# Maintainer: Luclu7 <me DOT luclu7 at fr>

pkgname=grabber
pkgver=7.1.1
pkgrel=1
pkgdesc="Very customizable imageboard/booru downloader with powerful filenaming features. "
arch=('x86_64')
url="https://bionus.github.io/imgbrd-grabber"
license=('Apache')
depends=('qt5-base' 'qt5-tools' 'qt5-multimedia' 'libpulse')
makedepends=('gcc' 'cmake')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("v${pkgver}.tar.gz::https://github.com/Bionus/imgbrd-grabber/archive/v${pkgver}.tar.gz"
        "${pkgname}.png"
        "${pkgname}.desktop")
sha256sums=('4ecb247f92fb4ba7c3245439bcd221e8c64dd037c1761065a663adb6b4571740'
            'b56858d78c967c582ac52d746c1d9a2845dd27ae8d9050060a67a60a776363bf'
            '8926561f81f2666d51461fd7d8c3ebad7a5b8ade2fc77f8ed36116853eddfee9')

prepare() {
  cd "$srcdir"
  tar xf v${pkgver}.tar.gz
  cd imgbrd-grabber-${pkgver}/
  mkdir -p build
}

build() {
  cd imgbrd-grabber-${pkgver}/build
  cmake ..
  make -j8
  cd ..
}

package() {
  cd imgbrd-grabber-${pkgver}/
  mv "build/gui/Grabber" "release/"
  touch "release/settings.ini"
  mkdir -p "${pkgdir}/usr/share/grabber"
  cp -r release/* "${pkgdir}/usr/share/grabber"
  cd ../
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
