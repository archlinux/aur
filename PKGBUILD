# Maintainer: Agorgianitis Loukas <agorglouk@gmail.com>

pkgname=vscode-tailwindcss-language-server-bin
pkgver=0.5.10
pkgrel=1
pkgdesc="Tailwind CSS language server component from tailwindcss-intellisense vscode extension"
arch=('any')
url="https://github.com/tailwindlabs/tailwindcss-intellisense"
license=('MIT')
depends=('nodejs' 'npm' 'typescript')
source=("https://github.com/tailwindlabs/tailwindcss-intellisense/releases/download/v${pkgver}/vscode-tailwindcss-${pkgver}.vsix")
sha256sums=('SKIP')

package() {
    unzip -o vscode-tailwindcss-${pkgver}.vsix
    mkdir -p "${pkgdir}/usr/share/tailwindcss-language-server"
    cp -R "${srcdir}/extension" "${pkgdir}/usr/share/tailwindcss-language-server/"
    cat <(echo '#!/usr/bin/env node') extension/dist/server/index.js > tailwindcss-language-server
    install -Dm 755 tailwindcss-language-server "${pkgdir}"/usr/bin/tailwindcss-language-server
}
