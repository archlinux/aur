# Maintainer: teraflops <prietus@live.com>

pkgname=iperfgtk-bin
_pkgname=iperfgtk
pkgver=0.1.1
pkgrel=1
pkgdesc="Modern native GTK4/libadwaita frontend for iperf3 with an analog VU-meter (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/prietus/iperfgtk"
license=('MIT')
depends=('gtk4' 'libadwaita' 'iperf3' 'gcc-libs' 'glibc')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("iperf_rust-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/iperf_rust-linux-x86_64")
source_aarch64=("iperf_rust-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/iperf_rust-linux-arm64")

sha256sums=('3e27fcc97f08afb9fda348186c37828cf2962779608037ea6d6d844fbf24d51c')
sha256sums_x86_64=('c7be91203b1f8b2ab149b3c54f66a1e784b49c8778c5dc68d7ae548e2bc92b44')
sha256sums_aarch64=('332f64c34508147245782d9155d4b55b3857163bc1e2ff9c1414287accbced01')

package() {
  install -Dm755 "$srcdir/iperf_rust-${pkgver}-${CARCH}" "$pkgdir/usr/bin/iperf_rust"

  cd "$srcdir/${_pkgname}-${pkgver}"

  install -Dm644 "data/io.github.iperf_rust.desktop" \
    "$pkgdir/usr/share/applications/io.github.iperf_rust.desktop"

  for s in 16 32 48 64 128 256 512; do
    install -Dm644 "data/icons/hicolor/${s}x${s}/apps/io.github.iperf_rust.png" \
      "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/io.github.iperf_rust.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
