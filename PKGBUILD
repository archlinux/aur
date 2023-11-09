# Maintainer: eugene hwang <hwang dot eug at gmail dot com>

_pkgname=single-file
pkgname=single-file-git
pkgver=r225.763be4d
pkgrel=3
pkgdesc="Command line tool to download a web page into a single HTML file"
arch=('any')
url="https://github.com/gildas-lormeau/single-file-cli"
license=('GNU Affero GPL')
makedepends=('git' 'npm')
depends=('nodejs')
provides=('single-file')
source=("${_pkgname}::git+https://github.com/gildas-lormeau/single-file-cli.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"

    npm install --user root --cache "${srcdir}/npm-cache"
    chmod 755 single-file

    mkdir -p "${pkgdir}/opt"
    cp -r "${srcdir}/${_pkgname}" "${pkgdir}/opt/${_pkgname}"

    mkdir -p ${pkgdir}/usr/bin
    ln -s "/opt/${_pkgname}/single-file" "${pkgdir}/usr/bin/single-file"
}
