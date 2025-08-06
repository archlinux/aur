# Maintainer: devome <evinedeng@hotmail.com>

_reponame="PT-Plugin-Plus"
_pkgname="${_reponame,,}-dev"
pkgname="${_reponame,,}-git"
pkgver=1.6.1.2884
pkgrel=1
pkgdesc="Microsoft Edge, Google Chrome, Firefox browser plugin (Web Extensions), which is mainly used to assist the seeds of downloading PT station."
arch=("any")
url="https://github.com/pt-plugins/${_reponame}"
provides=("${_pkgname}")
license=("MIT")
makedepends=("git" "jq" "yarn")
optdepends=('edge-stable' 'google-chrome')
source=("${_pkgname}::git+${url}.git#branch=dev")
sha256sums=('SKIP')
options=(!strip !debug)

pkgver() {
    cd "${_pkgname}"
    printf "%s.%s" "$(jq -r .version package.json)" "$(git rev-list --count --all)"
}

build() {
    cd "${_pkgname}"
    yarn
    yarn build
}

package() {
    cd "${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    cd "dist"
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${_pkgname}/"{} \;
}
