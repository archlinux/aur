# Maintainer: agony <27015 at riseup dot net>

pkgname=openapi-bin
pkgver=1.28.1
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
sha256sums_x86_64=('72a3ce7f2c3c0be1f090c8b1f6ce63cdab1d79e30e97593e8a9d18a712d0d4e9')
sha256sums_aarch64=('cfb6bdfe92d4fd7dba2b8d4026927cb5103cfdeea141292a0d5a236820c20c38')

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
