# Maintainer: Crandel
# shellcheck shell=bash disable=SC2034,SC2154

_pkgname=rustingstrata
pkgname="${_pkgname}-bin"
pkgver=1.3.0
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
sha256sums=('7b1e77ddf621db7fe01abee16b251d4ed3b795bbe1573b709a02f97b7f6dcd49'
            '4c9f9033588ba45efa888d96a6d3d7354a075300a984722acf28013b9c8c4e57')
sha256sums_x86_64=('2884efacba2e0172319c1d0b7d70afdd0a9cdab0a8f477712730ae005f64b42e')


package() {
  install -Dm755 "${_pkgname%}-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/${_pkgname}"
  # 1. Create target directories
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/licenses/$_pkgname"

  # Install documentation and licenses
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
