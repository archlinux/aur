# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=superharness-bin
pkgver=0.3.0
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
sha256sums_x86_64=('7183b5a03c341f73265988466284517f82dd52e858887956028f95529966b407')
sha256sums_aarch64=('17d4d30f9af0e95fdcd7efcde1b8ad18d49f3c1fb50f090c05f0b67269c02002')

source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::https://github.com/backmeupplz/superharness/releases/download/v${pkgver}/superharness-x86_64-unknown-linux-gnu")

source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::https://github.com/backmeupplz/superharness/releases/download/v${pkgver}/superharness-aarch64-unknown-linux-gnu")

latestver() {
    curl -fsSL "https://api.github.com/repos/backmeupplz/superharness/releases/latest" |
    jq -r '.tag_name // empty' | sed 's/^v//'
}

package() {
    install -Dm755 "${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
