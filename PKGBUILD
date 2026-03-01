# Maintainer: devome <evinedeng@hotmail.com>

_reponame="PT-depiler"
pkgname="${_reponame,,}"
pkgver=0.0.5.1538
pkgrel=1
pkgdesc="A web extension that can improve the efficiency of PT sites, based on PT-Plugin-Plus and Manifest v3."
arch=("any")
url="https://github.com/pt-plugins/${_reponame}"
provides=("${pkgname}")
conflicts=("${pkgname}")
license=("MIT")
makedepends=("git" "nodejs" "pnpm")
optdepends=('edge-stable' 'google-chrome')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('df789874f2326d487b2a2966a0503cdf1936ab5e984aa8006682fea476afb0f3')

build() {
    cd "${pkgname}"
    pnpm install
    pnpm build:dist
}

package() {
    cd "${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd dist-chrome
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/"{} \;
}
