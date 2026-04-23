# Maintainer: Y.K. Goon
# AUR Package for ClickDown - A fast and responsive ClickUp terminal client
pkgname=clickdown-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="A fast and responsive ClickUp desktop client for the terminal"
arch=('x86_64')
url="https://github.com/ykgoon/clickdown"
license=('MIT')
depends=('glibc' 'openssl' 'gcc-libs' 'zlib')
makedepends=('rust' 'cargo')
optdepends=('gtk3: for desktop integration')
provides=('clickdown')
conflicts=('clickdown')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ykgoon/clickdown/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "clickdown-${pkgver}"
  
  # Build the application
  cargo build --release
}

package() {
  cd "clickdown-${pkgver}"
  
  # Install binary
  install -Dm755 "target/release/clickdown" "${pkgdir}/usr/bin/clickdown"
  
  # Install license file (MIT)
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Install desktop entry
  install -Dm644 "../clickdown.desktop" "${pkgdir}/usr/share/applications/clickdown.desktop"
  
  # Install icon (if available)
  if [ -f "../clickdown.png" ]; then
    install -Dm644 "../clickdown.png" "${pkgdir}/usr/share/pixmaps/clickdown.png"
  fi
}