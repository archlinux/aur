# Maintainer: devome <evinedeng@hotmail.com>

_reponame="PT-depiler"
pkgname="${_reponame,,}"
pkgver=0.0.4
pkgrel=3
pkgdesc="Microsoft Edge, Google Chrome, Firefox browser plugin (Web Extensions), based on PT-Plugin-Plus and Manifest v3."
arch=("any")
url="https://github.com/pt-plugins/${_reponame}"
provides=("${pkgname}")
conflicts=("${pkgname}")
license=("MIT")
makedepends=("git" "pnpm")
optdepends=('edge' 'google-chrome')
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('15b93b1878778fe9b4b1bb552781780007e83b4d02f15ded346717cb1b9bd93f')

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
