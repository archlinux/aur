# Maintainer: agony <27015 at riseup dot net>

pkgname=oasdiff-bin
pkgver=1.36.0
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
sha256sums_x86_64=('dba65661f6d0f178a3e4884c309f19527a849388bb9df0e81545db76dbb697d6')
sha256sums_aarch64=('85eff4bc96334e19996c9ec819c5c10bb5a8f2fd070511f7d98ab96ec4f9933b')

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
