# Maintainer: Peter Fern <aur at 0xc0dedbad dot com>

pkgname=hyprpanel
pkgver=0.2.0
pkgrel=1
pkgdesc="An opinionated panel/shell for the Hyprland compositor."
arch=('x86_64' 'aarch64')
url="https://github.com/pdf/hyprpanel"
license=('MIT')
options=('!strip')
depends=('gtk4' 'gtk4-layer-shell' 'hyprland>=0.42.0')
optdepends=('systemd: logging support'
  'pulse-native-provider: volume control support'
  'upower: battery status support')
makedepends=('git' 'go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('84e1926182af7d13604f2d0c92dfac14b944bcb1b7ec7c752430a09dd180a61c')

build() {
  export CGO_ENABLED=0
  cd "${pkgname}-${pkgver}"
  go build -v -o "${pkgname}" "./cmd/${pkgname}"
  go build -v -o "${pkgname}-client" "./cmd/${pkgname}-client"
}

package() {
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${pkgname}-${pkgver}/${pkgname}-client" "${pkgdir}/usr/bin/${pkgname}-client"
}

# vim:set ts=2 sw=2 et:
