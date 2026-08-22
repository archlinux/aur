# Maintainer: James McMurray <jamesmcm03@gmail.com>

pkgname=vopono-gui
pkgver=0.10.21
pkgrel=1
pkgdesc='Graphical frontend for vopono'
arch=('any')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
depends=('vopono' 'gtk3' 'libayatana-appindicator' 'systemd-libs' 'xdotool')
makedepends=('pkgconf' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('485d2341bd331117fc74f986388c171c31034000a1cef5770f390d671c2557e6')
provides=('vopono-gui')
conflicts=('vopono-gui')

build() {
  cd "vopono-$pkgver"

  CFLAGS+=" -ffat-lto-objects" cargo build --release --manifest-path vopono-gui/Cargo.toml
}

package() {
  cd "vopono-$pkgver"

  install -Dm755 vopono-gui/target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 vopono-gui/vopono-gui.desktop "${pkgdir}/usr/share/applications/vopono-gui.desktop"
  install -Dm644 vopono-gui/logos/badge.png "${pkgdir}/usr/share/pixmaps/vopono-gui.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
