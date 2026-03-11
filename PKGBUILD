# Maintainer: soker <eduparra90 at gmail dot com>
pkgname=portless
pkgver=0.6.0
pkgrel=1
pkgdesc="Replace port numbers with stable, named .localhost URLs for local development. For humans and agents."
arch=('x86_64')
url="https://port1355.dev"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
options=('!strip')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('9e1b72333020075c5e54909e97d050d6dfa185ca3f8209999f829ce69db5db2d')

prepare() {
    cd package
    npm install --omit=dev --ignore-scripts
}

package() {
    cd package

    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r dist node_modules package.json "${pkgdir}/usr/lib/${pkgname}/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/dist/cli.js" "${pkgdir}/usr/bin/${pkgname}"

    # Ensure the CLI entry point is executable
    chmod +x "${pkgdir}/usr/lib/${pkgname}/dist/cli.js"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
