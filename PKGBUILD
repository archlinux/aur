# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=freebuff-bin
pkgver=0.0.110
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
sha256sums_x86_64=('fc24f52049a58daaae1408261da16f4c32fe04bc33062c313429b92b031130e1')
sha256sums_aarch64=('95010725505d503ffbceef7b482e3c22e85cc169c15217a2fe618c234f92633e')

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
