# Maintainer: RouHim

pkgname=binvec-bin
pkgver=1.20.32
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
sha256sums=('17386c95e9df70674861bab2538e6c29987a403fd3bba45c26a4f68b613452a7')
sha256sums_x86_64=('7b91d8bb121f02217a0f231db4da1e62bb8a53b0e5b93f87954f069380ef033e')
sha256sums_aarch64=('a5323b33c404344d21597b026cdc0371aa451e7666c3c1ab58bc4730ec7fa05d')
sha256sums_armv7h=('6ceaaa57d3aaf51edc0ea1be974f72ab9d6f3a7bffe0717ac2c30ea09af87611')
sha256sums_armv6h=('8149425e98f190f3a53a4c214d8171e3ed6fe1a0fbeb9721116d8555c49a0a1d')

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
