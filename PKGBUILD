# Maintainer: RouHim

pkgname=binvec-bin
pkgver=1.9.9
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
source_x86_64=("binvec-${pkgver}-x86_64-musl::https://github.com/RouHim/binvec/releases/download/${pkgver}/binvec-x86_64-musl")
source_aarch64=("binvec-${pkgver}-aarch64-musl::https://github.com/RouHim/binvec/releases/download/${pkgver}/binvec-aarch64-musl")
source_armv7h=("binvec-${pkgver}-armv7-musleabihf::https://github.com/RouHim/binvec/releases/download/${pkgver}/binvec-armv7-musleabihf")
source_armv6h=("binvec-${pkgver}-arm-musleabihf::https://github.com/RouHim/binvec/releases/download/${pkgver}/binvec-arm-musleabihf")

sha256sums_x86_64=('162a9991676ede8ed2843b6fc98dadbe027f8b981d226995bd4150f5153a865f')
sha256sums_aarch64=('ebde59f8c7dc536cd5cac4c046f1e7856654403afe98c132c5315ea577312729')
sha256sums_armv7h=('8758f364715a2db54b6021ece683c6c15c9ac9b703009f4429a0a412e897b781')
sha256sums_armv6h=('eeec3c7b6834fda3f1e95c79db910678054653e7202c2928e600d14e081dd84b')

package() {
  # Install binary
  install -Dm755 "binvec-${pkgver}-${CARCH}-musl" "${pkgdir}/usr/bin/binvec"

  # Special case for armv7h and armv6h which use different naming
  if [ "${CARCH}" = "armv7h" ]; then
    install -Dm755 "binvec-${pkgver}-armv7-musleabihf" "${pkgdir}/usr/bin/binvec"
  elif [ "${CARCH}" = "armv6h" ]; then
    install -Dm755 "binvec-${pkgver}-arm-musleabihf" "${pkgdir}/usr/bin/binvec"
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
