# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=pylance-language-server
pkgver=2020.8.0
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
source=("pylance.zip::https://${publisher}.gallery.vsassets.io/_apis/public/gallery/publisher/${publisher}/extension/${extension}/${pkgver}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
        'pylance-language-server')
sha256sums=('6a7eadbd8eb7de22cfd1ff68f220719d6e936ffbb5068492e4adee5a54f2f615'
            'a15ec816823ae1cbfd682aeae81dabb1b8bebcd3e5a07140b7ff95c9b5c23c8e')

package() {
    cd "${srcdir}/extension"
    find dist server package.json package.nls.json package.nls.ru.json -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/opt/${pkgname}/{}" \;
    install -Dm 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 "${srcdir}/extension/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
