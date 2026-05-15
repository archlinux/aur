# Maintainer: devome <evinedeng@hotmail.com>

_reponame="PT-depiler"
pkgname="${_reponame,,}"
pkgver=0.0.6.1688
pkgrel=1
pkgdesc="A web extension that can improve the efficiency of PT sites, based on PT-Plugin-Plus and Manifest v3."
arch=("any")
url="https://github.com/pt-plugins/${_reponame}"
provides=("${pkgname}")
conflicts=("${pkgname}")
license=("MIT")
makedepends=("git" "nodejs" "pnpm")
optdepends=("ptd-cli: Command-line interface for the PT-Depiler")
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('22f56a337472d54469f1dc3c5b26dc347224432faf416a5a67a41605cd969967')

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
