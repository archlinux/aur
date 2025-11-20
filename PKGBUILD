# Maintainer: RouHim

pkgname=binvec-bin
pkgver=1.20.14
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
sha256sums=('1fea2cef05e9664d0834cd6330a4d8758650e1b67cc2e63aaf06e0faf8842cb5')
sha256sums_x86_64=('84e99a80df40c0e78c7f7cd3f22415d745d2d37576025f47f41317b3c96e41a3')
sha256sums_aarch64=('84e99a80df40c0e78c7f7cd3f22415d745d2d37576025f47f41317b3c96e41a3')
sha256sums_armv7h=('84e99a80df40c0e78c7f7cd3f22415d745d2d37576025f47f41317b3c96e41a3')
sha256sums_armv6h=('84e99a80df40c0e78c7f7cd3f22415d745d2d37576025f47f41317b3c96e41a3')

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
