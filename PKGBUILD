# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=freebuff-bin
pkgver=0.0.118
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
sha256sums_x86_64=('2be36b4cfca5802f2cce42e5531e4fb804df3089e5a298cd01b524a7c3d20071')
sha256sums_aarch64=('e71e1f9efc2c8a5019ba6a2e3133a8857d06b31a0757d6d082b9003a665d8b41')

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
