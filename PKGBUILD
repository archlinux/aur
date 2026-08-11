# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=codeburn
pkgver=0.9.20
pkgrel=1
pkgdesc='See where your AI coding tokens go - interactive TUI dashboard for Claude Code, Codex, and Cursor cost observability'
arch=('any')
url='https://github.com/getagentseal/codeburn'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('4416d3b074047dba22b909a34347dd0d388d06679c7ca6e4d2d98420bef21d1c')

package() {
    cd "${srcdir}/package"
    npm install --omit=dev --ignore-scripts

    local _destdir="${pkgdir}/usr/lib/${pkgname}"
    install -dm755 "${_destdir}"
    cp -a dist node_modules package.json "${_destdir}/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/dist/cli.js" "${pkgdir}/usr/bin/${pkgname}"
}

latestver() {
    npm view codeburn dist-tags.latest
}
