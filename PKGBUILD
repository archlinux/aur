# Maintainer: RouHim

pkgname=binvec-bin
pkgver=1.9.19
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

sha256sums_x86_64=('df599a382c4c750f47e5278153e785c549bb2b57585e66b20970169426689272')
sha256sums_aarch64=('e1b3e2c807207552b64d48f102a27c5ea3d1c6a266ef254b1691df85b4739eee')
sha256sums_armv7h=('5f7d558b640529e8288c1e6469b512550efb1a9f49ee66c845533cd1c4ce0cdb')
sha256sums_armv6h=('72b0d33814ad7ef0b824df342b03cd68999eb8d93d33ce0f3bf5bd375f0d2889')

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
