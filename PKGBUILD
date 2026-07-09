# Maintainer: Ilyas Turki <ilyasturki at gmail dot com>
pkgname=phasionary-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="Terminal-first, single-user project planning tool"
arch=('x86_64' 'aarch64')
url="https://github.com/ilyasturki/phasionary"
license=('MIT')
depends=('glibc')
provides=('phasionary')
conflicts=('phasionary')
options=('!strip')

source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/phasionary-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/phasionary-linux-arm64")
sha256sums=('SKIP')
sha256sums_x86_64=('6d2b57bac1c3f2e3ebe6f0c84766149bebdef4cbc49c8fdad9d140b8083bf39c')
sha256sums_aarch64=('032d4e83455f405a18c884e34e773764475eced2c8ff899a0b5d60746b269926')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/phasionary"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    "${pkgdir}/usr/bin/phasionary" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/phasionary"
    "${pkgdir}/usr/bin/phasionary" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_phasionary"
    "${pkgdir}/usr/bin/phasionary" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/phasionary.fish"
}
