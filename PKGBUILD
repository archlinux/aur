# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=sem-bin
pkgver=0.10.1
pkgrel=1
pkgdesc='Semantic version control CLI — entity-level diff, blame, graph, and impact analysis via tree-sitter'
arch=('x86_64')
url='https://ataraxy-labs.github.io/sem/'
license=('Apache-2.0' 'MIT')
provides=('sem')
conflicts=('sem')
depends=('gcc-libs' 'glibc' 'openssl' 'zlib')
options=('!debug')
source_x86_64=("sem-${pkgver}-x86_64.tar.gz::https://github.com/Ataraxy-Labs/sem/releases/download/v${pkgver}/sem-linux-x86_64.tar.gz"
               "LICENSE-APACHE-${pkgver}::https://raw.githubusercontent.com/Ataraxy-Labs/sem/v${pkgver}/LICENSE-APACHE"
               "LICENSE-MIT-${pkgver}::https://raw.githubusercontent.com/Ataraxy-Labs/sem/v${pkgver}/LICENSE-MIT")
sha256sums_x86_64=('a948893401af848f6d0d33f16bc612bca6d5721e95a49bb9d3ba500ff55d698e'
                   '3d5ac2ca3c9e4bcd641e43c5512350cf62e15e527f9b4a720d52b546d9965a5f'
                   '0173d0fc0ea38a5124e9cc7eea9db01a14141ce1240508eb497f701394fe49eb')

latestver() {
    gh api --paginate repos/Ataraxy-Labs/sem/releases \
        --jq '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name == "sem-linux-x86_64.tar.gz")) | .tag_name' \
    | head -1 | sed 's/^v//'
}

package() {
    install -Dm755 sem "${pkgdir}/usr/bin/sem-cli"
    install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
