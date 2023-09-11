# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubeshark-bin
pkgdesc="Kubeshark is an API Traffic Analyzer for Kubernetes."
pkgver=50.2
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/kubeshark/kubeshark"
license=('apache')
conflicts=('kubeshark')
provides=('kubeshark')

sha256sums_x86_64=('4990c31e9ca9d7b27a7a872b54f675f92fad2049124beec760898493b24c29ce')
sha256sums_aarch64=('87f6c57123815f893eefcd682906da38393d16212de04399d6e0e57b40e600b4')

source_x86_64=(
    "kubeshark-$pkgver::https://github.com/kubeshark/kubeshark/releases/download/${pkgver}/kubeshark_linux_amd64"
)
source_aarch64=(
    "kubeshark-$pkgver::https://github.com/kubeshark/kubeshark/releases/download/${pkgver}/kubeshark_linux_arm64"
)

package() {
    install -D -m0755 "${srcdir}/kubeshark-$pkgver" "${pkgdir}/usr/bin/kubeshark"

    "${pkgdir}/usr/bin/kubeshark" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kubeshark"
    "${pkgdir}/usr/bin/kubeshark" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kubeshark"
}
