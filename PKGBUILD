# Maintainer: agony <27015 at riseup dot net>

pkgname=openapi-bin
pkgver=1.26.5
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
sha256sums_x86_64=('1339c003a22d80742bc0f7b7474d16a23f353c024db54a7a31c0d9f09218210c')
sha256sums_aarch64=('ef5bc86262b52da9ef5100541cbf8db9a561bcdbf9a44290471f632fbb25df89')

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
