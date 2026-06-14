# Maintainer: James McMurray <jamesmcm03@gmail.com>

pkgname=vopono-gui
pkgver=0.10.18
pkgrel=1
pkgdesc='Graphical frontend for vopono'
arch=('any')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
depends=('vopono' 'gtk3' 'libayatana-appindicator' 'systemd-libs' 'xdotool')
makedepends=('pkgconf' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "vopono-gui.desktop::${url}/raw/${pkgver}/vopono-gui/vopono-gui.desktop"
        "vopono-gui.png::${url}/raw/${pkgver}/vopono-gui/logos/badge.png")
sha256sums=('3b2c1d185af1065d61fc6cc9f90ba942d0134a3256e93713633640b600373b05'
            '1d3abd9b82e6f787878ab55a853b14ae55ecdeafb517c76ea1dff46700bb92dd'
            '53e20a4e1c3a3f1486cc05ae9cd19cbe1d9d3f92ed1e0445b4dfd45f7844d137')
provides=('vopono-gui')
conflicts=('vopono-gui')

build() {
  cd "vopono-$pkgver"

  CFLAGS+=" -ffat-lto-objects" cargo build --release --manifest-path vopono-gui/Cargo.toml
}

package() {
  cd "vopono-$pkgver"

  install -Dm755 vopono-gui/target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/vopono-gui.desktop" "${pkgdir}/usr/share/applications/vopono-gui.desktop"
  install -Dm644 "${srcdir}/vopono-gui.png" "${pkgdir}/usr/share/pixmaps/vopono-gui.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
