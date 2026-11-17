# Maintainer: agony <27015 at riseup dot net>

pkgname=openapi-bin
pkgver=1.27.0
pkgrel=1
pkgdesc='CLI for working with OpenAPI, Swagger, Arazzo and Overlay documents (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/speakeasy-api/openapi'
license=('MIT')
provides=("openapi=${pkgver}")
conflicts=('openapi')
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("openapi-${pkgver}-x86_64.tar.gz::${_release}/openapi_Linux_x86_64.tar.gz")
source_aarch64=("openapi-${pkgver}-aarch64.tar.gz::${_release}/openapi_Linux_arm64.tar.gz")
sha256sums_x86_64=('db69de1229883ffc0d23503d44e8e35b6d09c8587af17bd2137e4d34c622b9ed')
sha256sums_aarch64=('fb8710e7a2f461f48505ae9bb485a26236d002a88598b7f850bcb192889b942d')

build() {
  for shell in bash fish zsh; do
    ./openapi completion "${shell}" > "completion.${shell}"
  done
}

package() {
  install -Dm755 openapi -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/openapi"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/openapi.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_openapi"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
