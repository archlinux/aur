# Maintainer: Crandel
# shellcheck shell=bash disable=SC2034,SC2154

_pkgname=rustingstrata
pkgname="${_pkgname}-bin"
pkgver=1.4.0
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
sha256sums=('fb94fa7e2e9b408f50e45ef830ee97c6ea822320e15c7f7e363d46bbdf078c69'
            '4c9f9033588ba45efa888d96a6d3d7354a075300a984722acf28013b9c8c4e57')
sha256sums_x86_64=('24e11f419ce09e058f6e286e2cae964de569188d76587211cda3852087c4aaa1')


package() {
  install -Dm755 "${_pkgname%}-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/${_pkgname}"
  # 1. Create target directories
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/licenses/$_pkgname"

  # Install documentation and licenses
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
