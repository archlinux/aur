# Maintainer: 1dragon-xyz <https://github.com/1dragon-xyz/tomodorange>
pkgname=tomodorange
pkgver=0.1.2
pkgrel=1
pkgdesc="Native COSMIC™ Pomodoro timer for deep focus"
arch=('x86_64' 'aarch64')
url="https://github.com/1dragon-xyz/tomodorange"
license=('MIT OR Apache-2.0')
depends=('libxkbcommon' 'fontconfig' 'wayland' 'alsa-lib')
makedepends=('rust' 'cargo' 'cmake' 'pkg-config')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP') # Update with actual tarball sha256sum when publishing to AUR

_app_id="io.github._1dragon_xyz.tomodorange"

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm644 "assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_app_id}.png"
  install -Dm644 "${_app_id}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${_app_id}.metainfo.xml"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
