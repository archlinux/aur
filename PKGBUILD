# Maintainer: agony <27015 at riseup dot net>

pkgname=oasdiff-bin
pkgver=1.34.1
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
sha256sums_x86_64=('75775f65b0adebd26a8e013af51a799342dfdc6262d89efa9e3b7bdf89657d90')
sha256sums_aarch64=('e8f99bbf102a4b7f235104da72d0b9d67702e78622d1d4d37169e698ee90a249')

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
