# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=graphicle-bin
pkgver=0.1.2
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
sha256sums_x86_64=('2483b9d8fdc65086b162f0f3d0282c37f711556779676a4b09adadf18840e3ad')
sha256sums_aarch64=('ca5007731a5cc26be6ef4535702f64e0fb9c45c85d66991e5f8294ee6afbe835')

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
