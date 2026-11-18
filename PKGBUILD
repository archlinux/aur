# Maintainer: agony <27015 at riseup dot net>

pkgname=openapi-bin
pkgver=1.28.0
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
sha256sums_x86_64=('7a2a6b4d971b47b5c7e6ee8fe4272e6d4e62708fadd7cca7c756d832e232b783')
sha256sums_aarch64=('99690742e5b2e5395db64bfb81bda9d5c0af7587ebf97503fbeee7082aa3712c')

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
