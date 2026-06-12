# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=codebuff-bin
pkgver=1.0.681
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
sha256sums_x86_64=('b54fa3506432b902f29caaffc7e370f6cf8ae4944a425b5ef2fff4ce6f2d0420')
sha256sums_aarch64=('8bb5a8a1ab38952b8c40165be6e9b65d68e9789da8510c56f778eff34a7a964f')

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
