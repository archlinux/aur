# Maintainer: Yueyuri <lxf74663@gmail.com>
pkgname=dart-simple-live-bin
pkgver=1.12.7
pkgrel=1
pkgdesc="A live streaming client. Forked from xiaoyaocz/dart_simple_live"
arch=('x86_64')
url="https://github.com/June6699/dart_simple_live"
license=('GPL-3.0-only')
depends=('gtk3' 'mpv' 'libx11' 'xz' 'glibc' 'gcc-libs')
provides=('dart-simple-live' 'simple-live-app')
conflicts=('dart-simple-live' 'simple-live-app' 'simple-live-app-bin')
source=("${pkgname}-${pkgver}.zip::https://github.com/June6699/dart_simple_live/releases/download/v${pkgver}/SimpleLive-Linux-v${pkgver}.zip"
        "dart-simple-live.desktop")
sha256sums=('879f7acd7712889fd94189f737697817c53a2cde16b1e4c0186b7803780f1fb8'
            '4db111d2c11aa2826f4806fd1d6eb920a0f41a5178772fce61ca2a273b2e2a99')

package() {
  install -d "${pkgdir}/opt/${pkgname%-bin}"
  
  cp -r "${srcdir}/data" "${pkgdir}/opt/${pkgname%-bin}/"
  cp -r "${srcdir}/lib" "${pkgdir}/opt/${pkgname%-bin}/"
  
  install -Dm755 "${srcdir}/simple_live_app" "${pkgdir}/opt/${pkgname%-bin}/dart-simple-live"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname%-bin}/dart-simple-live" "${pkgdir}/usr/bin/dart-simple-live"

  install -Dm644 "${srcdir}/dart-simple-live.desktop" "${pkgdir}/usr/share/applications/dart-simple-live.desktop"
  install -Dm644 "${srcdir}/data/flutter_assets/assets/images/logo.png" "${pkgdir}/usr/share/pixmaps/dart-simple-live.png"
}
