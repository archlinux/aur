# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=pylance-language-server
pkgver=2020.9.0
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
sha256sums=('598a16085ef243ba7b23cf04cdb900e06e042326b9d8d5be95348edfe258b499'
            '5fdd2854288f6ed6c8090a79ccb47ccec65085a2b660f078669e0789894b2471')

package() {
    cd "${srcdir}/extension"
    find dist package.json package.nls.json package.nls.ru.json -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/opt/${pkgname}/{}" \;
    install -Dm 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 "${srcdir}/extension/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
