# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=superharness-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Autonomous multi-agent orchestrator for AI coding agents via tmux"
arch=('x86_64' 'aarch64')
url="https://superharness.dev"
license=('MIT')
depends=('gcc-libs' 'glibc' 'tmux')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')

source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/backmeupplz/superharness/v${pkgver}/LICENSE")
sha256sums=('fb0a10b0661523fb534263b83eeafe79ea2d9783f90a6ea20dbddb8d4a494031')
sha256sums_x86_64=('f4114e2d4f2c82641da2be08e6f518bc24b7965889b7cddc93dfc2a2d2e46b9b')
sha256sums_aarch64=('1dfafa81d7c193846299563849f5aeed9ba71bde3561183beb97cffe05d2dfd1')

source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::https://github.com/backmeupplz/superharness/releases/download/v${pkgver}/superharness-x86_64-unknown-linux-gnu")

source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::https://github.com/backmeupplz/superharness/releases/download/v${pkgver}/superharness-aarch64-unknown-linux-gnu")

latestver() {
    gh api --paginate repos/backmeupplz/superharness/releases \
        --jq '.[] | select(.assets[].name == "superharness-x86_64-unknown-linux-gnu") | .tag_name' |
    head -1 | sed 's/^v//'
}

package() {
    install -Dm755 "${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
