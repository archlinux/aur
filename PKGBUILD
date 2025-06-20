# Maintainer: RouHim

pkgname=binvec-bin
pkgver=1.9.25
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

sha256sums_x86_64=('6da08544ec7ea1fef674900158bc3caf65ba1c2a7e4103d9b948743230d81ff1')
sha256sums_aarch64=('6da08544ec7ea1fef674900158bc3caf65ba1c2a7e4103d9b948743230d81ff1')
sha256sums_armv7h=('6da08544ec7ea1fef674900158bc3caf65ba1c2a7e4103d9b948743230d81ff1')
sha256sums_armv6h=('6da08544ec7ea1fef674900158bc3caf65ba1c2a7e4103d9b948743230d81ff1')

package() {
  # Install binary
  install -Dm755 "binvec-${pkgver}-${CARCH}-unknown-linux-gnu" "${pkgdir}/usr/bin/binvec"

  # Special case for armv7h and armv6h which use different naming
  if [ "${CARCH}" = "armv7h" ]; then
    install -Dm755 "binvec-${pkgver}-armv7-unknown-linux-gnueabihf" "${pkgdir}/usr/bin/binvec"
  elif [ "${CARCH}" = "armv6h" ]; then
    install -Dm755 "binvec-${pkgver}-arm-unknown-linux-gnueabihf" "${pkgdir}/usr/bin/binvec"
  fi

  # Create documentation directory
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"

  # Download the documentation files
  curl -s "https://raw.githubusercontent.com/RouHim/binvec/${pkgver}/README.md" -o "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  curl -s "https://raw.githubusercontent.com/RouHim/binvec/${pkgver}/CHANGELOG.md" -o "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

  # Download the license file
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  curl -s "https://raw.githubusercontent.com/RouHim/binvec/${pkgver}/LICENSE" -o "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
