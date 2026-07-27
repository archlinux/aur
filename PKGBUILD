# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=codesight
pkgver=1.19.0
pkgrel=1
pkgdesc='AI context generator - codebase mapping, token optimization, and MCP server for Claude Code, Cursor, and Codex'
arch=('any')
url='https://github.com/Houseofmvps/codesight'
# Upstream declares MIT in package.json but ships no LICENSE text (MIT is
# copyright-bearing, so nothing can be installed until upstream adds one).
license=('MIT')
depends=('nodejs')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('36dda6f4895f0d274586806b08e4f965235d7105bba2e24f82eff62d07c5b825')

package() {
    cd "${srcdir}/package"

    local _destdir="${pkgdir}/usr/lib/${pkgname}"
    install -dm755 "${_destdir}"
    cp -a dist package.json "${_destdir}/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/dist/index.js" "${pkgdir}/usr/bin/${pkgname}"
}

latestver() {
    npm view codesight dist-tags.latest
}
