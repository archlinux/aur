# Maintainer: Rushikesh Gaikwad <rushikeshwastaken@gmail.com>
pkgname=ice-cli-bin
_upname=ice
pkgver=0.0.1
pkgrel=1
pkgdesc="Ice CLI streaming player (prebuilt binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/Wraient/ice"
license=('MIT')
depends=('mpv')
optdepends=('rofi: graphical selection via rofi')
provides=("${_upname}=${pkgver}" "ice-cli")
conflicts=("${_upname}" "ice-cli")

_src_linux_amd64="${_upname}-linux-amd64"
_src_linux_arm64="${_upname}-linux-arm64"

# Versioned (immutable) release tarballs/binaries; adjust when releasing new tag.
source_x86_64=("${_src_linux_amd64}::https://github.com/Wraient/${_upname}/releases/download/v${pkgver}/${_upname}-linux-amd64" \
               "LICENSE::https://raw.githubusercontent.com/Wraient/${_upname}/v${pkgver}/LICENSE")
source_aarch64=("${_src_linux_arm64}::https://github.com/Wraient/${_upname}/releases/download/v${pkgver}/${_upname}-linux-arm64" \
                "LICENSE::https://raw.githubusercontent.com/Wraient/${_upname}/v${pkgver}/LICENSE")

sha256sums_x86_64=('SKIP' 'SKIP')
sha256sums_aarch64=('SKIP' 'SKIP')

build() { :; }

package() {
  cd "$srcdir"
  case "$CARCH" in
    x86_64)
      install -Dm755 "${_src_linux_amd64}" "$pkgdir/usr/bin/${_upname}"
      ;;
    aarch64)
      install -Dm755 "${_src_linux_arm64}" "$pkgdir/usr/bin/${_upname}"
      ;;
  esac
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et
