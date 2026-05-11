# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=codeburn
pkgver=0.9.8
pkgrel=1
pkgdesc='See where your AI coding tokens go - interactive TUI dashboard for Claude Code, Codex, and Cursor cost observability'
arch=('any')
url='https://github.com/getagentseal/codeburn'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('7121663ec853f58b8497d891c5910535c0f0e34f4be0ba62bcdb02d37623b523')

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
