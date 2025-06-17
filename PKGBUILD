# Maintainer: RouHim

pkgname=binvec-bin
pkgver=1.9.21
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

sha256sums_x86_64=('7dde559acc44c281123ce39ff40c573887cfda00fb395fcf8404930e3946c7aa')
sha256sums_aarch64=('536223331f0fe5aebe2ee2f27b72eb06427d22d1766ef858909a3ea0ea4224b3')
sha256sums_armv7h=('9f159337e10c49178f25532f743015914310af661e29058ddece9c7c24af166f')
sha256sums_armv6h=('3def121a5a743a7e5ec091da9b641405bca09a9dd717f3f7ba37df141108e860')

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
