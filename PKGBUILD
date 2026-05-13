# Maintainer: anhdh <https://github.com/anhdh/tomodorange>
pkgname=tomodorange
pkgver=0.1.0
pkgrel=1
pkgdesc="Native COSMIC™ Pomodoro timer for deep focus"
arch=('x86_64' 'aarch64')
url="https://github.com/anhdh/tomodorange"
license=('MIT' 'Apache')
depends=('libxkbcommon' 'fontconfig' 'wayland' 'alsa-lib')
makedepends=('rust' 'cargo' 'cmake' 'pkg-config')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP') # Replace with actual hash after first release

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm644 "${pkgname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname}.metainfo.xml"
}
