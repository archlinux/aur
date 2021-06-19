# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Johannes Wienke <languitar@semipol.de>

_npmname=vscode-css-languageserver-bin
pkgname=vscode-css-languageserver-bin
pkgver=1.4.0
pkgrel=2
pkgdesc='Binary version published on npm of vscode-css-languageserver extracted from VSCode tree'
arch=('any')
url='https://github.com/vscode-langservers/vscode-css-languageserver-bin'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
sha256sums=('daa006f74a6baa265e743811bf224003048144c805bc3a9dd3f8175d4815bced')
noextract=("${_npmname}-${pkgver}.tgz")

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
    install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chown -R root:root "${pkgdir}"
}
