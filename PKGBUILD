# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubeshark-bin
pkgdesc="Kubeshark is an API Traffic Analyzer for Kubernetes."
pkgver=50.4
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/kubeshark/kubeshark"
license=('apache')
conflicts=('kubeshark')
provides=('kubeshark')

sha256sums_x86_64=('12e75282001a54f31f652b42d3528cddda4af7f4cc91c460737753fa29cc41cd')
sha256sums_aarch64=('045353a1ea846c37bea685f1333cd6666daef9e369ff1617958e5416c8e1ddc2')

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
