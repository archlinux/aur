# Maintainer: Ilyas Turki <ilyasturki at gmail dot com>
pkgname=ordo-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Terminal-first, single-user project planning tool"
arch=('x86_64' 'aarch64')
url="https://github.com/ilyasturki/ordo"
license=('MIT')
depends=('glibc')
provides=('ordo')
conflicts=('ordo')
options=('!strip')

source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/ordo-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/ordo-linux-arm64")
sha256sums=('SKIP')
sha256sums_x86_64=('9f3f4a90abfb5bd81c5ee30f1be60c665b057f46750646dcfa703c106738b8e1')
sha256sums_aarch64=('d27bcc10bd4b395e8c1d2844578414c23d0932019d5394b616b782fec190a58c')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/ordo"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    "${pkgdir}/usr/bin/ordo" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/ordo"
    "${pkgdir}/usr/bin/ordo" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_ordo"
    "${pkgdir}/usr/bin/ordo" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/ordo.fish"
}
