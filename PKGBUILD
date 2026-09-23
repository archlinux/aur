# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=freebuff-bin
pkgver=0.0.184
pkgrel=1
pkgdesc='Free AI coding agent for the terminal, by Codebuff'
arch=('x86_64' 'aarch64')
url='https://freebuff.com'
license=('Apache-2.0')
depends=('glibc')
provides=('freebuff')
conflicts=('freebuff')
options=('!strip' '!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://codebuff.com/api/releases/download/${pkgver}/freebuff-linux-x64.tar.gz")
sha256sums_x86_64=('10edc47adf14cb9aa5ff63a49c92279d1780733c18d1b0756057484fc45224fe')
sha256sums_aarch64=('4025d5b560afe7fde0954374a0b4a435d791ec45d8b8caafae2e4337a2c6002a')

source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://codebuff.com/api/releases/download/${pkgver}/freebuff-linux-arm64.tar.gz")

latestver() {
    curl -fsSL 'https://registry.npmjs.org/freebuff/latest' | python3 -c "import sys,json; print(json.load(sys.stdin)['version'])"
}

pkgver() {
    latestver
}

package() {
    install -Dm755 freebuff "${pkgdir}/usr/lib/freebuff/freebuff"
    install -Dm644 tree-sitter.wasm "${pkgdir}/usr/lib/freebuff/tree-sitter.wasm"
    install -d "${pkgdir}/usr/bin"
    ln -s ../lib/freebuff/freebuff "${pkgdir}/usr/bin/freebuff"
}
