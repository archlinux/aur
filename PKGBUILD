# Maintainer: lingdianshiren <ldsrwu@foxmail.com>

pkgname=fluxdown-bin
pkgver=0.1.27
pkgrel=1
#epoch=
pkgdesc="A Rust-powered download manager with HTTP, FTP, BitTorrent and HLS/DASH streaming support. Smart multi-threaded acceleration, seamless browser integration, beautiful interface — free forever, zero ads."
url="https://fluxdown.zerx.dev/"
provide=("fluxdown")
conflict=("fluxdown-appimage")
arch=('x86_64')
license=('LicenseRef-custom')
depends=('gtk3')
source=(
  "https://fluxdown.zerx.dev/api/download/FluxDown-${pkgver}-linux-x64.tar.gz"
  "LICENSE.html"
)
sha256sums=('fcc652efd22824056d46cab1dc068aea663b9fa8849c9c266b7975623e5e1a16'
            'c0c71478dc43ef82e440c31ba4115547e19c72c6e40b1aa6941e40bf47ccf8ee')
options=(!strip)
package() {
  install -d "$pkgdir/opt/$pkgname"
  install -Dm755 "${srcdir}/FluxDown-${pkgver}-linux-x64/flux_down" "$pkgdir/opt/$pkgname/flux_down"
  install -Dm755 "${srcdir}/FluxDown-${pkgver}-linux-x64/fluxdown_nmh" "$pkgdir/opt/$pkgname/fluxdown_nmh"
  cp -r "${srcdir}/FluxDown-${pkgver}-linux-x64/lib" "$pkgdir/opt/$pkgname/"
  cp -r "${srcdir}/FluxDown-${pkgver}-linux-x64/data" "$pkgdir/opt/$pkgname/"

  install -Dm644 "${srcdir}/FluxDown-${pkgver}-linux-x64/data/icons/hicolor/256x256/apps/com.fluxdown.app.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/io.github.thetumultuousunicornofdarkness.cpu-x.png.png"
  install -Dm644 "${srcdir}/FluxDown-${pkgver}-linux-x64/data/icons/hicolor/scalable/apps/com.fluxdown.app.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.fluxdown.app.svg"
  install -Dm644 "${srcdir}/FluxDown-${pkgver}-linux-x64/data/com.fluxdown.app.desktop" \
    "${pkgdir}/usr/share/applications/com.fluxdown.app.desktop"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/flux_down" "$pkgdir/usr/bin/flux_down"
}
