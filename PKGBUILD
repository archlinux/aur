# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=graphicle-bin
pkgver=0.1.1
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
sha256sums_x86_64=('9c92c76b111da52b2c52168b1c11853f0a46323b6d5e17664add803582e43863')
sha256sums_aarch64=('00a0cf1f5b080883694c6cd08e6339d6e8fb6947fa3f5197d644773d868095aa')

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
