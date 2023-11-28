# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubeshark-bin
pkgdesc="Kubeshark is an API Traffic Analyzer for Kubernetes."
pkgver=51.0.18
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/kubeshark/kubeshark"
license=('apache')
conflicts=('kubeshark')
provides=('kubeshark')

sha256sums_x86_64=('a4fe9e8d566b7ac8a6de35e9e885ceb2ba30885f9baf88fdc5762059dd62e9f3')
sha256sums_aarch64=('1f6ceb9b55c21e4bc3381001d4d62c12063edd24889ce485a380c20b1b4530ea')

source_x86_64=(
    "kubeshark-$pkgver::https://github.com/kubeshark/kubeshark/releases/download/v${pkgver}/kubeshark_linux_amd64"
)
source_aarch64=(
    "kubeshark-$pkgver::https://github.com/kubeshark/kubeshark/releases/download/v${pkgver}/kubeshark_linux_arm64"
)

package() {
    install -D -m0755 "${srcdir}/kubeshark-$pkgver" "${pkgdir}/usr/bin/kubeshark"

    "${pkgdir}/usr/bin/kubeshark" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kubeshark"
    "${pkgdir}/usr/bin/kubeshark" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kubeshark"
}
