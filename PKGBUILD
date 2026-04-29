# Maintainer: Guru <anjanaya@gmail.com>
pkgname=epinio-bin
pkgver=1.13.10
pkgrel=1
pkgdesc="Opinionated platform that runs on Kubernetes that takes you from App to URL in one step"
arch=('x86_64' 'aarch64')
url="https://epinio.io"
license=('Apache-2.0')
depends=('glibc')
provides=('epinio')
conflicts=('epinio')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/epinio/epinio/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/epinio/epinio/releases/download/v${pkgver}/epinio-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/epinio/epinio/releases/download/v${pkgver}/epinio-linux-arm64")
noextract=("${pkgname}-${pkgver}-x86_64" "${pkgname}-${pkgver}-aarch64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('2d0d6d7adaa2daf35f8a6e5af6d2b0e86babf3fefeee95e7314a070126a713f6')
sha256sums_aarch64=('b2a9a0c64a82f154a512cbcc5b830baef507bf6f7556a6492c88a24a06f36fd7')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/epinio"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    "${pkgdir}/usr/bin/epinio" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/epinio"
    "${pkgdir}/usr/bin/epinio" completion zsh  | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_epinio"
    "${pkgdir}/usr/bin/epinio" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/epinio.fish"
}
