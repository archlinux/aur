# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=photofiltrelx
pkgver=1.0.2
pkgrel=1
pkgdesc="Simple but featureful editor. Built for casual graphic editing and performance."
arch=('i686' 'x86_64')
url="http://photofiltre-lx.org/"
license=('GPL3')
depends=('desktop-file-utils' 'graphicsmagick' 'hicolor-icon-theme' 'qt5-base')
makedepends=('imagemagick')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PhotoFiltre-LX/${pkgname}/archive/${pkgver}.tar.gz"
        'photofiltrelx.desktop')
sha256sums=('063062a6121b807b977c0276cfd55bdafe0dcbeeba85f43649de6108f300f9f7'
            '76ab31a371e3c04e0a2bb7d08ddc6289183ac42f19cbbaaea74e3eb2bba9fb2f')

build() {
  cd "${pkgname}-${pkgver}"
  qmake-qt5
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 PhotoFiltreLX "${pkgdir}/usr/bin/PhotoFiltre-LX"
  install -Dm644 ../photofiltrelx.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  #icons
  for size in 256 192 128 64 48 32 24 22 16; do
    install -d "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps
    convert pixmaps/logo.png -resize ${size} "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps/PhotoFiltre-LX.png
  done
}
