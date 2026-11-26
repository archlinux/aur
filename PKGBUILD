# Maintainer: Crandel
# shellcheck shell=bash disable=SC2034,SC2154

_pkgname=rustingstrata
pkgname="${_pkgname}-bin"
pkgver=1.3.7
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
sha256sums=('1bdc2cb3d3ced844ee5365a4b54093c70b6577c81fdf4b4025d4432072446ee0'
            '4c9f9033588ba45efa888d96a6d3d7354a075300a984722acf28013b9c8c4e57')
sha256sums_x86_64=('732f318626c530b35eeabf96b129f7720bec39200e8f2fb782161c7f0beaf10c')


package() {
  install -Dm755 "${_pkgname%}-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/${_pkgname}"
  # 1. Create target directories
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/licenses/$_pkgname"

  # Install documentation and licenses
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
