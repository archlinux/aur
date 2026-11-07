# Maintainer: Artem Shustrov <shustrov_a@inbox.ru>
pkgname=cloudlogin-bin
pkgver=1.0.2
pkgrel=2
pkgdesc='Cloud.ru authentication helper for Evolution Managed Kubernetes'
arch=('x86_64')
url='https://github.com/cloud-ru-tech/cloudlogin'
license=('Apache-2.0')
provides=('cloudlogin')
conflicts=('cloudlogin')
optdepends=('kubectl: access to Managed Kubernetes clusters')

source=("${pkgname}-${pkgver}-amd64.tar.gz::${url}/releases/download/v${pkgver}/cloudlogin_Linux_amd64.tar.gz")
sha256sums=('195535c4c528d15600d11e09f9f4a917e458d127b391715a05c68331ed3c64bf')

package() {
    install -Dm755 "${srcdir}/cloudlogin" "${pkgdir}/usr/bin/cloudlogin"
    install -Dm644 "${srcdir}/License" "${pkgdir}/usr/share/licenses/${pkgname}/License"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -d "${pkgdir}/usr/share/bash-completion/completions" \
        "${pkgdir}/usr/share/zsh/site-functions" \
        "${pkgdir}/usr/share/fish/vendor_completions.d"
    "${srcdir}/cloudlogin" completion bash > "${pkgdir}/usr/share/bash-completion/completions/cloudlogin"
    "${srcdir}/cloudlogin" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_cloudlogin"
    "${srcdir}/cloudlogin" completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/cloudlogin.fish"
}
