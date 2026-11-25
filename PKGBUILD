# Maintainer: agony <27015 at riseup dot net>

pkgname=oasdiff-bin
pkgver=1.41.0
pkgrel=1
pkgdesc='Diff and breaking changes for OpenAPI specifications (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/oasdiff/oasdiff'
license=('Apache-2.0')
provides=("oasdiff=${pkgver}")
conflicts=('oasdiff')
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("${_release}/oasdiff_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_release}/oasdiff_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('96365453163118e6503eb71742643d9ee67f91aedbaadd1a1ce9c6213e3b71c7')
sha256sums_aarch64=('8d4b8ddd467440885675db918e229ab8db330111c6428eb864e7eb766a7f4071')

build() {
  for shell in bash fish zsh; do
    ./oasdiff completion "${shell}" > "completion.${shell}"
  done
}

package() {
  install -Dm755 oasdiff -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/oasdiff"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/oasdiff.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_oasdiff"
}
