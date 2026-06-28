# Maintainer: Carlos Prieto <prietus@live.com>

pkgname=nmapgtk-bin
_pkgname=nmapgtk
pkgver=0.1.0
pkgrel=1
pkgdesc="Modern native GTK4/libadwaita frontend for nmap (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/prietus/nmapgtk"
license=('MIT')
depends=('gtk4' 'libadwaita' 'nmap' 'gcc-libs' 'glibc')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("nmapgtk-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/nmapgtk-linux-x86_64")
source_aarch64=("nmapgtk-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/nmapgtk-linux-arm64")

sha256sums=('8ba2d404dd68a8e77a031df48c8f2ad1433c721d5e897ddb96e6d4a891e63ada')
sha256sums_x86_64=('bc98e756f8a8c86a6126824172f7438d9da5812b8a1cd749390d301ad7f4abdc')
sha256sums_aarch64=('8b7ba557e028d886bcf7d287694c768436ecae6b60f247431056606a224bd565')

package() {
  install -Dm755 "$srcdir/nmapgtk-${pkgver}-${CARCH}" "$pkgdir/usr/bin/nmapgtk"

  cd "$srcdir/${_pkgname}-${pkgver}"

  install -Dm644 "data/io.github.nmapgtk.desktop" \
    "$pkgdir/usr/share/applications/io.github.nmapgtk.desktop"

  for s in 16 32 48 64 128 256 512; do
    install -Dm644 "data/icons/hicolor/${s}x${s}/apps/io.github.nmapgtk.png" \
      "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/io.github.nmapgtk.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
