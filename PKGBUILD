# Maintainer: Johannes Wienke <languitar@semipol.de>

_npmname=yaml-language-server
pkgname=yaml-language-server-bin
pkgver=0.16.0
pkgrel=3
pkgdesc="Language server implementation for YAML files and optional schema support"
arch=('any')
url="https://www.npmjs.com/package/vscode-html-languageserver-bin"
license=('MIT')
makedepends=('npm')
depends=('nodejs')
replaces=('yaml-language-server')
provides=('yaml-language-server')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha1sums=('86b2eb2de1b5186e88464b386b367e54b87de55f')

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
    mkdir -p "${pkgdir}/usr/bin"
    # make the server executable
    sed -i '1s;^;#!/usr/bin/env\n;' "${pkgdir}/usr/bin/yaml-language-server"
}
