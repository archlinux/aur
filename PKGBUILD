# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=codebuff-bin
pkgver=1.0.686
pkgrel=1
pkgdesc='AI coding agent for the terminal'
arch=('x86_64' 'aarch64')
url='https://codebuff.com'
license=('Apache-2.0')
depends=('glibc')
provides=('codebuff')
conflicts=('codebuff')
options=('!strip' '!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://codebuff.com/api/releases/download/${pkgver}/codebuff-linux-x64.tar.gz")
sha256sums_x86_64=('4aa4f2145f88385e8e24fd9beee6e21da27a60d48f2cdc624f3bc97139f0c565')
sha256sums_aarch64=('56086bcb8c95295b463cd3f96fee8064685911662f5aa4610aa6098491f66d69')

source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://codebuff.com/api/releases/download/${pkgver}/codebuff-linux-arm64.tar.gz")

latestver() {
    curl -fsSL 'https://registry.npmjs.org/codebuff/latest' | python3 -c "import sys,json; print(json.load(sys.stdin)['version'])"
}

pkgver() {
    latestver
}

package() {
    install -Dm755 codebuff "${pkgdir}/usr/lib/codebuff/codebuff"
    install -Dm644 tree-sitter.wasm "${pkgdir}/usr/lib/codebuff/tree-sitter.wasm"
    install -d "${pkgdir}/usr/bin"
    ln -s ../lib/codebuff/codebuff "${pkgdir}/usr/bin/codebuff"
    ln -s ../lib/codebuff/codebuff "${pkgdir}/usr/bin/cb"
}
