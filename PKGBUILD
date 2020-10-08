# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=pylance-language-server
pkgver=$(./version.sh)
pkgrel=1
pkgdesc='Python language server based on pylance vscode extension.'
arch=('x86_64')
url='https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance'
license=('custom: commercial')
depends=('nodejs')
provides=('pylance-language-server')
conflicts=('pylance-language-server')
install=pylance-language-server.install
publisher='ms-python'
extension='vscode-pylance'
source=("pylance-${pkgver}.zip::https://${publisher}.gallery.vsassets.io/_apis/public/gallery/publisher/${publisher}/extension/${extension}/${pkgver}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
        'pylance-language-server')
sha256sums=('SKIP'
            '0f86657f29b12c43d6a6e7858b3ee020141b4a125558bc2216018bd2cc2ebf42')

package() {
    cd "${srcdir}/extension"
    find dist package.json package.nls.json package.nls.ru.json -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/opt/${pkgname}/{}" \;
    install -Dm 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 "${srcdir}/extension/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
