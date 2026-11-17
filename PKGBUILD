# Maintainer: agony <27015 at riseup dot net>

pkgname=oasdiff-bin
pkgver=1.39.0
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
sha256sums_x86_64=('71a85930728f367a2086077b7ae1411319421549d18473a3e8258b6451520433')
sha256sums_aarch64=('481db7d891d916f13df277b2ef8bbb95477702827710e49fe22cef69c359c780')

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
