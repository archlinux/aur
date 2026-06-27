# Maintainer: teraflops <prietus@live.com>

pkgname=iperfgtk-bin
_pkgname=iperfgtk
pkgver=0.1.0
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

sha256sums=('5f5af6c0edab68ca79677748f2804c35db0a113129d6761d3969d7f7480aa01d')
sha256sums_x86_64=('f83c64e1b15286e689115493110116411a485901dd22c6e8b8f702e9cbfd9ad1')
sha256sums_aarch64=('eeb626d85f921dfe24ae681e9969ee8132db3d54d2b0a8f94cfa2f88fb67d562')

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
