# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=codemap-bin
pkgver=4.0.4
pkgrel=1
pkgdesc="A project brain for your AI. Give LLMs instant architectural context without burning tokens"
arch=('x86_64' 'aarch64')
url="https://github.com/JordanCoin/codemap"
license=('MIT')
provides=('codemap')
conflicts=('codemap')
depends=('git')
optdepends=('ast-grep: for dependency flow mode')
options=('!debug' '!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/JordanCoin/codemap/releases/download/v${pkgver}/codemap_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('86ff956a2b9ddfd811c7370c37b1b5a1928affd4a2f2992f56c175c73a43bae6')
sha256sums_aarch64=('d6dc8db4ec54bb4f498508fe4587fdf0f5ea407ac2325eaddb4c4331cc3e4b6a')
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/JordanCoin/codemap/releases/download/v${pkgver}/codemap_${pkgver}_linux_arm64.tar.gz")

latestver() {
    curl -fsSL "https://api.github.com/repos/JordanCoin/codemap/releases/latest" |
    jq -r '.tag_name // empty' | sed 's/^v//'
}

package() {
    cd "$srcdir"
    
    install -Dm755 codemap "$pkgdir/usr/bin/codemap"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    if [ -d "sg-rules" ]; then
        install -d "$pkgdir/usr/share/codemap/sg-rules"
        install -m644 sg-rules/* "$pkgdir/usr/share/codemap/sg-rules/"
    fi
}
