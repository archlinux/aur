# Maintainer: Agil Mammadov <mammadovagil@proton.me>
pkgname=cpak-bin
pkgver=2.11.1
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
sha256sums=('c771524ded4d0114970f05c064a3e3604636a68205480129975635ba7f897253')
sha256sums_x86_64=('9bf04ef7b391e7524d2ef0b82e21f53c77c555c4579b36ababe5c22ae3de97c4'
                   'd936785f53fdd8db7b532a17b8b5eae866278228779e6f3e3cf3408673f2341b')
sha256sums_aarch64=('2d89b922bc2a8e92e7da10373f7bb4e43061eda6c0b9d0d6fc0c59971f380269'
                    '95156bfa611f2daff29224f2ff45ba1b7e8e8bc02e6323315f583aaa74dc8f9b')

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
