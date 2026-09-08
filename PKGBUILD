# Maintainer: RouHim

pkgname=binvec-bin
pkgver=1.20.28
pkgrel=1
pkgdesc="A simple application to convert raster graphics to vector graphics (pre-compiled)"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/RouHim/binvec"
license=('MIT')
provides=('binvec')
conflicts=('binvec')
depends=()
options=('!strip')

# Source code archive for desktop files and icons
source=("binvec-${pkgver}.tar.gz::https://github.com/RouHim/binvec/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('eefd256be965e27794f3e3f2e237aa2a8ec34c7537ef7eab43192d2389199a91')
sha256sums_x86_64=('bf888ea333dc5e650aba98e2e96d01d368c2b95f9c9007e33dee0c91a49b3910')
sha256sums_aarch64=('a75bbc91203e88cb037a61f95ccc7d2312dc4856f981abf19be70a0c7083087d')
sha256sums_armv7h=('763775c15b6cb6642c987d7caddbdfcc20c9017c7aa5a0b9004a5cc7f5a89883')
sha256sums_armv6h=('ea40084b114e3950284dd9ad275e4cdcc584e1d76746ec4b1e2e7b0b7465654f')

# Map Arch Linux architectures to Rust build targets
source_x86_64=("binvec-${pkgver}-x86_64-unknown-linux-gnu::https://github.com/RouHim/binvec/releases/download/${pkgver}/binvec-x86_64-unknown-linux-gnu")
source_aarch64=("binvec-${pkgver}-aarch64-unknown-linux-gnu::https://github.com/RouHim/binvec/releases/download/${pkgver}/binvec-aarch64-unknown-linux-gnu")
source_armv7h=("binvec-${pkgver}-armv7-unknown-linux-gnueabihf::https://github.com/RouHim/binvec/releases/download/${pkgver}/binvec-armv7-unknown-linux-gnueabihf")
source_armv6h=("binvec-${pkgver}-arm-unknown-linux-gnueabihf::https://github.com/RouHim/binvec/releases/download/${pkgver}/binvec-arm-unknown-linux-gnueabihf")


package() {
  # Install binary
  install -Dm755 "binvec-${pkgver}-${CARCH}-unknown-linux-gnu" "${pkgdir}/usr/bin/binvec"

  # Special case for armv7h and armv6h which use different naming
  if [ "${CARCH}" = "armv7h" ]; then
    install -Dm755 "binvec-${pkgver}-armv7-unknown-linux-gnueabihf" "${pkgdir}/usr/bin/binvec"
  elif [ "${CARCH}" = "armv6h" ]; then
    install -Dm755 "binvec-${pkgver}-arm-unknown-linux-gnueabihf" "${pkgdir}/usr/bin/binvec"
  fi

  # Reference to the extracted source directory
  local srcdir_source="$srcdir/binvec-${pkgver}"

  # Install desktop file
  install -Dm644 "${srcdir_source}/.desktop/binvec.desktop" "${pkgdir}/usr/share/applications/binvec.desktop"

  # Install icon
  install -Dm644 "${srcdir_source}/.desktop/icon.png" "${pkgdir}/usr/share/pixmaps/binvec.png"
}
