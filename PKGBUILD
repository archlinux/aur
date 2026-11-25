# Maintainer: Crandel
# shellcheck shell=bash disable=SC2034,SC2154

_pkgname=rustingstrata
pkgname="${_pkgname}-bin"
pkgver=1.3.2
pkgrel=1
pkgdesc="Pure-Rust inference engine for Qwen GGUF models. Precompiled binaries"
url="https://github.com/RustingStudio/RustingStrata"
arch=("x86_64")
license=('RustingStrata License 1.0')

provides=("rustingstrata=$pkgver")
conflicts=("rustingstrata")
depends=('glibc' 'vulkan-driver')
source=(
  "README-${pkgver}.md::https://raw.githubusercontent.com/RustingStudio/RustingStrata/refs/tags/v${pkgver}/README.md"
  "LICENSE.md::https://raw.githubusercontent.com/RustingStudio/RustingStrata/refs/heads/main/LICENSE.md"
)
source_x86_64=("${_pkgname%}-${pkgver}-${pkgrel}"::"${url}/releases/download/v${pkgver}/rustingstrata-linux-$CARCH")
sha256sums=('3f0b6f4c7b78dc7861529d9a92c3e6378993185b2827825bfd3fa0547d685ce9'
            '4c9f9033588ba45efa888d96a6d3d7354a075300a984722acf28013b9c8c4e57')
sha256sums_x86_64=('656bcc76b7a5dd1be776a30dfce9fcf71f677eb7839ca7c60e6b39a6544dea76')


package() {
  install -Dm755 "${_pkgname%}-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/${_pkgname}"
  # 1. Create target directories
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/licenses/$_pkgname"

  # Install documentation and licenses
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
