# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubeshark-bin
pkgdesc="Kubeshark is an API Traffic Analyzer for Kubernetes."
pkgver=52.1.66
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/kubeshark/kubeshark"
license=('apache')
conflicts=('kubeshark')
provides=('kubeshark')

sha256sums_x86_64=('f1987f71e2b8bb61cf3ffcc54966cac333513168bb87107fefac537dd4a78e66')
sha256sums_aarch64=('69164237fb1579bb1ecf5142d2a775d8cd96848c311707fe4643f5e4290887b9')

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
