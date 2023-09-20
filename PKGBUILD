# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubeshark-bin
pkgdesc="Kubeshark is an API Traffic Analyzer for Kubernetes."
pkgver=50.3
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/kubeshark/kubeshark"
license=('apache')
conflicts=('kubeshark')
provides=('kubeshark')

sha256sums_x86_64=('b272b5f48ea23005fd546a552287e59d78c4af04d7a0e48a4dba46a1752d050c')
sha256sums_aarch64=('6c2633a4c5d3cea331b77d4ddd7cc3151a4dc47a693ffedbb96b1ec5e15e5128')

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
