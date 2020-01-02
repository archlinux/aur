# Maintainer: Fraser P. Newton <fpnewton90@gmail.com>
pkgname=azure-storage-explorer
pkgver=1.11.2
pkgrel=1
pkgdesc="Storage Explorer allows you to view and interact with your Azure Storage resources."
arch=('x86_64')
url="https://github.com/microsoft/AzureStorageExplorer"
license=('CCPL' 'MIT')
depends=('gconf' 'libgnome-keyring' 'nodejs' 'gtk3' 'nss' 'libxss' 'libsecret')
provides=('StorageExplorer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/microsoft/AzureStorageExplorer/releases/download/v${pkgver}/Linux_StorageExplorer.tar.gz"
        "https://raw.githubusercontent.com/microsoft/AzureStorageExplorer/master/LICENSE")
sha256sums=('967d35fe4dd61a0ce8cac06b025ecc686f69a75dcffa6dac7108d06f55546004'
            '9bbc1ea9fe5c96df01b311a2ac864d5b18fc87b9948bfd14770e4b44db755ee9')

prepare() {
    rm "$pkgname-$pkgver.tar.gz"
    rm LICENSE
}

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    cp -a * "${pkgdir}/opt/${pkgname}"

    # Symlink the application in /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/StorageExplorer" "${pkgdir}/usr/bin/${pkgname}"

    # Add the icon and desktop files
    install -D -m644 "resources/app/out/app/icon.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
    install -D -m644 ../StorageExplorer.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install the license file
    install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}