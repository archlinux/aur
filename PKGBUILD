# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=repak-bin
pkgver=0.2.3
pkgrel=1
pkgdesc='Unreal Engine .pak file library and CLI in Rust (binary release)'
arch=('x86_64')
url='https://github.com/trumank/repak'
license=('Apache-2.0' 'MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!debug')

latestver() {
    gh api repos/trumank/repak/releases/latest --jq '.tag_name' | sed 's/^v//'
}

source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.xz::https://github.com/trumank/repak/releases/download/v${pkgver}/repak_cli-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('933bdb8e26f34e8fd70ea50201efca39df041de58aa83b1cd6eb83da124a2046')

package() {
    local _srcdir="${srcdir}/repak_cli-x86_64-unknown-linux-gnu"

    install -Dm755 "${_srcdir}/repak" "${pkgdir}/usr/bin/repak"
    install -Dm644 "${_srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${_srcdir}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 "${_srcdir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
