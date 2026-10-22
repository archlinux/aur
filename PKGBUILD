# Maintainer: Ilyas Turki <ilyasturki at gmail dot com>
pkgname=ordo-bin
pkgver=0.12.1
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
sha256sums_x86_64=('4394034e0155cdd47cc4f4d8d894d1020e75a36a93dd36443a2094c003d74e41')
sha256sums_aarch64=('9b05ef8435b66dddefd6fc0ee96f8cf3aba429d573e3a2d583a31237a1254816')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/ordo"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    "${pkgdir}/usr/bin/ordo" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/ordo"
    "${pkgdir}/usr/bin/ordo" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_ordo"
    "${pkgdir}/usr/bin/ordo" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/ordo.fish"
}
