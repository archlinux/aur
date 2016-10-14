# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=photofiltrelx-git
pkgver=1.0.1.r2.gf898c80
pkgrel=1
pkgdesc="Simple but featureful editor. Built for casual graphic editing and performance."
arch=('i686' 'x86_64')
url="http://photofiltre-lx.org/"
license=('GPL3')
depends=('desktop-file-utils' 'graphicsmagick' 'hicolor-icon-theme' 'qt5-base')
makedepends=('git' 'imagemagick')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
source=("git+https://github.com/PhotoFiltre-LX/photofiltrelx.git"
        'photofiltrelx.desktop')
sha256sums=('SKIP'
            '76ab31a371e3c04e0a2bb7d08ddc6289183ac42f19cbbaaea74e3eb2bba9fb2f')

pkgver() {
  cd photofiltrelx
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd photofiltrelx
  qmake-qt5
  make
}

package() {
  cd photofiltrelx
  install -Dm755 PhotoFiltreLX "${pkgdir}/usr/bin/PhotoFiltre-LX"
  install -Dm644 ../photofiltrelx.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  #icons
  for size in 256 192 128 64 48 32 24 22 16; do
    install -d "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps
    convert pixmaps/logo.png -resize ${size} "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps/PhotoFiltre-LX.png
  done
}
