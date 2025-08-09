# Maintainer: NourEddineX <NourEddineX at ProtonMail dot com>
# Mubeng Maintainer: Dwi Siswanto 2021-2025 <https://github.com/dwisiswant0>

pkgname=mubeng-bin
_pkgname=mubeng
pkgver=0.23.0
pkgrel=1
pkgdesc="An incredibly fast proxy checker & IP rotator with ease (pre-compiled binary)"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/mubeng/mubeng"
license_url="https://raw.githubusercontent.com/mubeng/mubeng/refs/heads/master/LICENSE"
license=('Apache-2.0')
depends=()
makedepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")

# Set the source URL based on the architecture
case "${CARCH}" in
  x86_64)
    _arch="amd64"
    ;;
  i686)
    _arch="386"
    ;;
  aarch64)
    _arch="arm64"
    ;;
  armv7h)
    # No armv7 binary exists, using the compatible armv6 binary instead.
    _arch="armv6"
    ;;
esac

_source_binary="${_pkgname}_${pkgver}_linux_${_arch}"
_source_full_url="${_source_binary}::${url}/releases/download/v${pkgver}/${_source_binary}"
source_x86_64=("${_source_full_url}")
source_i686=("${_source_full_url}")
source_aarch64=("${_source_full_url}")
source_armv7h=("${_source_full_url}")

# Architecture-specific checksums
sha256sums_x86_64=('90ca4f0ee9b0069cd6634392cc43d816886bb17e371e54f9a6b749689f05dbfc')
sha256sums_i686=('7a2ca9615d61108f6a7dae684e26553154ee33a681d3feabc4c079a1cb2f8ddb')
sha256sums_aarch64=('40cb0727f72fc804a2056bc5da4721700bc6bd7e5eaf3354a0e3bd617ac1b346')
sha256sums_armv7h=('cdd83c3a456fbe27e99a963602047d01e81e89573f5fb5a47dc8fa3f2a8cd978')

package() {
  # Install the binary from the extracted tarball
  install -Dm755 "${_source_binary}" "${pkgdir}/usr/bin/${_pkgname}"
}
