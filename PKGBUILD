# Maintainer: devome <evinedeng@hotmail.com>

_reponame="PT-depiler"
pkgname="${_reponame,,}"
pkgver=0.0.6.1868
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
sha256sums=('b6959dd144f0368ba42a0b78abd230cef4c459346ac2d1ea749151606c343548')

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
