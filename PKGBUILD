# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=codebuff-bin
pkgver=1.0.684
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
sha256sums_x86_64=('2317ffd83964024fbfe536ce3bd57401a5b2aaa8bafdd36509df3398880cea2b')
sha256sums_aarch64=('5ef942aeffc40e0b70d61f237b9b057985c120917774f35caa2f7b4aba11ec4f')

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
