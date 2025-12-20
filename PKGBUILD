# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=codemap-bin
pkgver=3.1.6
pkgrel=1
pkgdesc="A project brain for your AI. Give LLMs instant architectural context without burning tokens"
arch=('x86_64')
url="https://github.com/JordanCoin/codemap"
license=('MIT')
provides=('codemap')
conflicts=('codemap')
depends=('git')
optdepends=('ast-grep: for dependency flow mode')
options=('!debug' '!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/JordanCoin/codemap/releases/download/v${pkgver}/codemap_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('3df556c8378fd7e74d2dc9f4050275d628532761331b348bbfa544618366144b')

latestver() {
    curl -s "https://api.github.com/repos/JordanCoin/codemap/releases/latest" |
    jq -r '.tag_name' | sed 's/^v//'
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
