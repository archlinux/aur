# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=freebuff-bin
pkgver=0.2.29
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
sha256sums_x86_64=('a9729858a173c6671d043c8af0cda45999dd3e408233159c2a0d8673c1c2f073')
sha256sums_aarch64=('06d2954f6aacac05bc0bab98f5defd816ed57fb79a11c94aa08c5e437972fe06')

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
