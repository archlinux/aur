# Maintainer: eugene hwang <hwang dot eug at gmail dot com>

_pkgname=single-file
pkgname=single-file-git
pkgver=r766.62efa4e
pkgrel=2
pkgdesc="Command line tool to download a web page into a single HTML file"
arch=('any')
url="https://github.com/gildas-lormeau/single-file-cli"
license=('GNU Affero GPL')
makedepends=('git' 'npm')
depends=('nodejs' 'deno')
provides=('single-file')
source=(
    "${pkgname}::git+https://github.com/gildas-lormeau/single-file-cli.git"
    "single-file"
)
sha256sums=(
    'SKIP'
    'aaae3b387f3544db9fed75d10367b8dae79f4c252b592a45cb6e018356d4086e'
)

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"

#    npm install --user root --cache "${srcdir}/npm-cache"
    chmod 755 single-file

    mkdir -p "${pkgdir}/opt"
    cp -r "${srcdir}/${pkgname}" "${pkgdir}/opt/${_pkgname}"

    mkdir -p ${pkgdir}/usr/bin
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

#    ln -s "/opt/${_pkgname}/single-file" "${pkgdir}/usr/bin/single-file"
}
