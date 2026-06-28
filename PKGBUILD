# Maintainer: teraflops <prietus@live.com>

pkgname=iperfgtk-bin
_pkgname=iperfgtk
pkgver=0.1.2
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

sha256sums=('80d8ef8f85ab9852b74f8f8b2e12d36c063f818964b14803e709645d80f4ce3f')
sha256sums_x86_64=('58f97c7a545a9fa843acfe3e4c44d690393bb439bdb7a05a459cb84d8b7e0b84')
sha256sums_aarch64=('f9400ed710ac9b7b972d4d9e3e696840cb0b15b123c04170847ac8f9cc17baf4')

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
