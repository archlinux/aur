# Maintainer: Sergio Fernandez (GeiserX) <9169332+GeiserX@users.noreply.github.com>
pkgname=lynxprompt
pkgver=2.1.1
pkgrel=1
pkgdesc='CLI for LynxPrompt - Generate, sync, and manage AI IDE configuration files (AGENTS.md, CLAUDE.md, .cursorrules, and more)'
arch=('any')
url='https://lynxprompt.com'
license=('GPL-3.0-or-later')
depends=('nodejs>=18')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('343ebed5ff61bccb98204d1078d1917f743c4f6aadf7d3920f5602aa7e5d9abc')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
    npm install -g --prefix="${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Fix permissions
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # Remove references to pkgdir
    find "${pkgdir}" -name package.json -exec sed -i "s|${pkgdir}||g" {} +

    # Install license
    install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
