# Maintainer: RouHim

pkgname=binvec-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="A simple application to convert raster graphics to vector graphics (pre-compiled)"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/RouHim/binvec"
license=('MIT')
provides=('binvec')
conflicts=('binvec')
depends=()
options=('!strip')

# Map Arch Linux architectures to Rust build targets
source_x86_64=("binvec-${pkgver}-x86_64-unknown-linux-gnu::https://github.com/RouHim/binvec/releases/download/${pkgver}/binvec-x86_64-unknown-linux-gnu")
source_aarch64=("binvec-${pkgver}-aarch64-unknown-linux-gnu::https://github.com/RouHim/binvec/releases/download/${pkgver}/binvec-aarch64-unknown-linux-gnu")
source_armv7h=("binvec-${pkgver}-armv7-unknown-linux-gnueabihf::https://github.com/RouHim/binvec/releases/download/${pkgver}/binvec-armv7-unknown-linux-gnueabihf")
source_armv6h=("binvec-${pkgver}-arm-unknown-linux-gnueabihf::https://github.com/RouHim/binvec/releases/download/${pkgver}/binvec-arm-unknown-linux-gnueabihf")

sha256sums_x86_64=('7cf4ca2f9be8653a33ce846317c6a9fec991781fa0d0aa7242edc73437d04991')
sha256sums_aarch64=('7cf4ca2f9be8653a33ce846317c6a9fec991781fa0d0aa7242edc73437d04991')
sha256sums_armv7h=('7cf4ca2f9be8653a33ce846317c6a9fec991781fa0d0aa7242edc73437d04991')
sha256sums_armv6h=('7cf4ca2f9be8653a33ce846317c6a9fec991781fa0d0aa7242edc73437d04991')

package() {
  # Install binary
  install -Dm755 "binvec-${pkgver}-${CARCH}-unknown-linux-gnu" "${pkgdir}/usr/bin/binvec"

  # Special case for armv7h and armv6h which use different naming
  if [ "${CARCH}" = "armv7h" ]; then
    install -Dm755 "binvec-${pkgver}-armv7-unknown-linux-gnueabihf" "${pkgdir}/usr/bin/binvec"
  elif [ "${CARCH}" = "armv6h" ]; then
    install -Dm755 "binvec-${pkgver}-arm-unknown-linux-gnueabihf" "${pkgdir}/usr/bin/binvec"
  fi

  # Install desktop file
  install -Dm644 "${startdir}/.desktop/binvec.desktop" "${pkgdir}/usr/share/applications/binvec.desktop"

  # Install icon
  install -Dm644 "${startdir}/icon.png" "${pkgdir}/usr/share/pixmaps/binvec.png"
}
