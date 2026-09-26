# Maintainer: devome <evinedeng@hotmail.com>

_reponame="PT-depiler"
pkgname="${_reponame,,}"
pkgver=0.0.6.1927
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
sha256sums=('9c5a636e317791036f3d3310596b13ab23cb145003476836ad04a12e8fc3d26a')

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
