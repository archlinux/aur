# Maintainer: James McMurray <jamesmcm03@gmail.com>

pkgname=vopono-gui
pkgver=0.10.17
pkgrel=1
pkgdesc='Graphical frontend for vopono'
arch=('any')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
depends=('vopono' 'gtk3' 'libayatana-appindicator' 'systemd-libs' 'xdotool')
makedepends=('pkgconf' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('92f0e610905a6469c152b64b9ce2c232e8d0acd01ba328ae607428001b2029ca')
provides=('vopono-gui')
conflicts=('vopono-gui')

build() {
  cd "vopono-$pkgver"

  CFLAGS+=" -ffat-lto-objects" cargo build --release --manifest-path vopono-gui/Cargo.toml
}

package() {
  cd "vopono-$pkgver"

  install -Dm755 vopono-gui/target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
