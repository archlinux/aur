# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=graphicle-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="Code graph and memory for repositories and coding agents, in one Rust program"
arch=('x86_64' 'aarch64')
url="https://github.com/Graphicle-AI/graphicle"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'zlib')
optdepends=('git: repository cloning and Git-hook setup'
            'xdg-utils: open the web app with `graphicle open`')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
# Prebuilt programs, already stripped upstream: the build must not mutate them.
options=('!strip' '!debug')

source_x86_64=("graphicle-${pkgver}-x86_64.tar.gz::https://github.com/Graphicle-AI/graphicle/releases/download/v${pkgver}/graphicle-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("graphicle-${pkgver}-aarch64.tar.gz::https://github.com/Graphicle-AI/graphicle/releases/download/v${pkgver}/graphicle-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('12eb500d31acc4e26fbc5a4e634209f9b6190b0780f60754e66686554a0bcb3e')
sha256sums_aarch64=('ee1d8e3ec49847e8458c5513557f4ca148c53f44174d6eb8a2d3cb4a2976ccb9')

latestver() {
    curl -fsSLI -o /dev/null -w '%{url_effective}\n' \
        'https://github.com/Graphicle-AI/graphicle/releases/latest' |
        sed -nE 's|.*/tag/v([0-9]+(\.[0-9]+)*)$|\1|p'
}

package() {
    local _dir="graphicle-${pkgver}-${CARCH}-unknown-linux-gnu"

    install -Dm755 "${_dir}/graphicle" "${pkgdir}/usr/bin/graphicle"
    install -Dm755 "${_dir}/graphicle-graph" "${pkgdir}/usr/bin/graphicle-graph"

    install -Dm644 "${_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${_dir}/NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"

    install -Dm644 "${_dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${_dir}/CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
