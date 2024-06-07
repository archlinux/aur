# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubeshark-bin
pkgdesc="Kubeshark is an API Traffic Analyzer for Kubernetes."
pkgver=52.3.62
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/kubeshark/kubeshark"
license=('apache')
conflicts=('kubeshark')
provides=('kubeshark')

sha256sums_x86_64=('8be2229dc64856f4b57d2fdff3830f2e500b9dc3ee2ebdd1edc18c245f80e608')
sha256sums_aarch64=('8be2229dc64856f4b57d2fdff3830f2e500b9dc3ee2ebdd1edc18c245f80e608')

source_x86_64=(
    "${pkgname}-${pkgver}::https://github.com/kubeshark/kubeshark/releases/download/v${pkgver}/kubeshark_linux_amd64"
)
source_aarch64=(
    "${pkgname}-${pkgver}::https://github.com/kubeshark/kubeshark/releases/download/v${pkgver}/kubeshark_linux_arm64"
)

package() {
    install -D -m0755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/kubeshark"

    "${pkgdir}/usr/bin/kubeshark" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kubeshark"
    "${pkgdir}/usr/bin/kubeshark" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kubeshark"
}
