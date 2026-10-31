# Maintainer: jaboll <spexe0011@gmail.com>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=open-quickshare
pkgver=0.15.2
pkgrel=1
pkgdesc="Complete Quick Share implementation for Linux with Bluetooth LE and Wi-Fi Direct"
arch=('x86_64' 'aarch64')
url="https://github.com/ignotusbucius/${pkgname}"
license=('GPL-3.0-only')

depends=(
  'gtk3'
  'libayatana-appindicator'
  'libsoup3'
  'webkit2gtk-4.1'
  'bluez'
  'networkmanager'
)

optdepends=(
  'wpa_supplicant: Wi-Fi Direct support with a compatible NetworkManager backend'
  'bluez-utils: Bluetooth troubleshooting utilities'
)

makedepends=(
  'cargo'
  'nodejs'
  'pnpm'
  'protobuf'
)

provides=(
  'r-quick-share'
  'rquickshare'
)

conflicts=(
  'r-quick-share'
  'rquickshare'
)

options=('!lto')

source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('SKIP')

prepare() {
  cd "${pkgname}-$pkgver/app/main"
  pnpm install --frozen-lockfile
}

build() {
  cd "${pkgname}-$pkgver/app/main"
  pnpm tauri build -b deb
}

package() {
  cd "${pkgname}-$pkgver/app/main"
  cp -a src-tauri/target/release/bundle/deb/${pkgname}_${pkgver}_*/data/* "${pkgdir}"
}
