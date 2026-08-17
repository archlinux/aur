# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=hermes-decomp-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="A powerful decompiler that lets you reverse-engineer React Native mobile apps by converting their compiled Hermes bytecode (.hbc) files back into readable JavaScript"
arch=('x86_64')
url="https://github.com/SymbioticSec/hermes-decomp"
license=('MIT')
provides=('hermes-decomp')
conflicts=('hermes-decomp')
depends=('gcc-libs' 'glibc')
options=('!debug')
source_x86_64=(
    "${pkgname%-bin}-${pkgver}-${CARCH}.tar.gz::https://github.com/SymbioticSec/hermes-decomp/releases/download/v${pkgver}/hermes-decomp-v${pkgver}-linux-${CARCH}.tar.gz"
    "${pkgname%-bin}-${pkgver}-LICENSE::https://raw.githubusercontent.com/SymbioticSec/hermes-decomp/v${pkgver}/LICENSE"
)
sha256sums_x86_64=('ffbe444bc6a9dd260f1d96d26ce5ee1c943103dac96aa99b8a053438e3e3fc9e' '8fcd18a6a1e3739ce61f6e836d5fc01de38f3777d89accb234bd4cdc990eda66')

latestver() {
    gh api repos/SymbioticSec/hermes-decomp/releases/latest --jq '.tag_name' | sed 's/^v//'
}

package() {
    install -Dm755 "${srcdir}/hermes-decomp" "${pkgdir}/usr/bin/hermes-decomp"
    install -Dm755 "${srcdir}/hermes-mcp" "${pkgdir}/usr/bin/hermes-mcp"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
