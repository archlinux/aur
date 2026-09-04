# Maintainer: Agil Mammadov <mammadovagil@proton.me>
pkgname=cpak-bin
pkgver=2.12.6
pkgrel=1
pkgdesc="A fast, decentralized, portable, powerful and low-memory footprint package format for Linux."
arch=('x86_64' 'aarch64')
url="https://github.com/Containerpak/cpak"
license=('LGPL-2.1-only')
provides=('cpak')
conflicts=('cpak')
options=('!strip')

depends=(
  'slirp4netns'
  'util-linux'
  'dbus'
  'polkit'
  'tar'
  'gzip'
  'xdg-utils'
)

optdepends=(
  'webkit2gtk-4.1: web preview adapter'
  'qt6-base: Qt UI adapter'
  'knotifications: KDE notifications'
  'gnome-keyring: Secret Service backend'
  'kwallet5: KWallet Secret Service backend'
)

source=("cpak-${pkgver}.tar.gz::https://github.com/Containerpak/cpak/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1e9b4a1bcd5f1fb9059b4495d07ddc334480651897dd27968d9e4ea1ffd9be60')
sha256sums_x86_64=('141e8e3eb448a3d9ea6a49dbe885486b7babcc0fc2a009fe5a4cf718579af7f8'
                   'cc5ddf5fba5cbc9612b50cdb5fb9d5cfded3cd5d13297f1e8602b874f944aa40')
sha256sums_aarch64=('93d6c9f6324e8f2f5883416c6b16151b566749f7452c82147d538e6e309031b4'
                    'f19bcb33e71a06328b13c00cb0ed56c45cea4e163b0427c76e609f6d6b6c5c59')

source_x86_64=(
  "cpak-linux-amd64::https://github.com/Containerpak/cpak/releases/download/v${pkgver}/cpak-linux-amd64"
  "cpak-storaged-linux-amd64::https://github.com/Containerpak/cpak/releases/download/v${pkgver}/cpak-storaged-linux-amd64"
)

source_aarch64=(
  "cpak-linux-arm64::https://github.com/Containerpak/cpak/releases/download/v${pkgver}/cpak-linux-arm64"
  "cpak-storaged-linux-arm64::https://github.com/Containerpak/cpak/releases/download/v${pkgver}/cpak-storaged-linux-arm64"
)

package() {
  cd "cpak-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  case "$CARCH" in
    x86_64)  _suffix=amd64 ;;
    aarch64) _suffix=arm64 ;;
  esac

  install -Dm755 "${srcdir}/cpak-linux-${_suffix}" \
    "${pkgdir}/usr/bin/cpak"

  install -Dm755 "${srcdir}/cpak-storaged-linux-${_suffix}" \
    "${pkgdir}/usr/lib/cpak/cpak-storaged"
}
