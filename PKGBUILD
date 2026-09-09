# Maintainer: RouHim

pkgname=binvec-bin
pkgver=1.20.29
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
sha256sums=('fc85a8efcb0b7cff25e21934c1edd3909e4873e6abb5f86dcd05caf9f754cdc3')
sha256sums_x86_64=('e01c544e93ab3ce2e130b8f5d1234ac790c585eec768950427156447f547be38')
sha256sums_aarch64=('3cb6f845e0ef65a721590e7a21c1cee7e03fdef78f944aa7329f6fba2711b5fe')
sha256sums_armv7h=('213ab6f9d94706041ffbe7c0494b94445f90782c7eb89fa8d3634e6cf9ca9c3a')
sha256sums_armv6h=('6b7f677de69a6a3d31e7c35d76dd61a163aea00aacf57473dbaf919510927701')

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
