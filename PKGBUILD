# Maintainer: Johannes Wienke <languitar@semipol.de>

_npmname=yaml-language-server
pkgname=yaml-language-server-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Language server implementation for YAML files and optional schema support"
arch=('any')
url="https://www.npmjs.com/package/vscode-html-languageserver-bin"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha1sums=('431c93e0b3148066f26064634725be1252ce58f5')

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
    mkdir -p "${pkgdir}/usr/bin"
    # make the server executable
    sed -i '1s;^;#!/usr/bin/env\n;' "${pkgdir}/usr/bin/yaml-language-server"
}
