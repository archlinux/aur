# Maintainer: Fraser P. Newton <fpnewton90@gmail.com>
pkgname=azure-storage-explorer
pkgver=1.25.1
pkgrel=1
pkgdesc="Storage Explorer allows you to view and interact with your Azure Storage resources."
arch=('x86_64')
url="https://github.com/microsoft/AzureStorageExplorer"
license=('CCPL' 'MIT')
depends=('dotnet-runtime' 'nodejs' 'gtk3' 'nss' 'libsecret' 'alsa-lib')
provides=('azure-storage-explorer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/microsoft/AzureStorageExplorer/releases/download/v${pkgver}/Linux_StorageExplorer-x64.tar.gz"
        "https://raw.githubusercontent.com/microsoft/AzureStorageExplorer/master/LICENSE"
	"StorageExplorer.desktop")
sha256sums=('7895283b43f38a16c644b94415fd5b5258b3e26424c8c4f1f168afd60f241410'
            '9bbc1ea9fe5c96df01b311a2ac864d5b18fc87b9948bfd14770e4b44db755ee9'
            'ed90ef85054cd2860d6c0e123a0db52a81014a6433e02952a57926ab115b7717')

prepare() {
    rm "$pkgname-$pkgver.tar.gz"
}

package() {
    # Install application
    install -d "${pkgdir}/opt/${pkgname}"
    install -m 644 "chrome_100_percent.pak" "${pkgdir}/opt/${pkgname}/"
    install -m 644 "chrome_200_percent.pak" "${pkgdir}/opt/${pkgname}/"
    install -m 755 "chrome_crashpad_handler" "${pkgdir}/opt/${pkgname}/"
    install -m 755 "chrome-sandbox" "${pkgdir}/opt/${pkgname}/"
    install -m 644 "icudtl.dat" "${pkgdir}/opt/${pkgname}/"
    install -m 644 "libEGL.so" "${pkgdir}/opt/${pkgname}/"
    install -m 644 "libffmpeg.so" "${pkgdir}/opt/${pkgname}/"
    install -m 644 "libGLESv2.so" "${pkgdir}/opt/${pkgname}/"
    install -m 644 "libvk_swiftshader.so" "${pkgdir}/opt/${pkgname}/"
    install -m 644 "libvulkan.so.1" "${pkgdir}/opt/${pkgname}/"
    install -m 644 "resources.pak" "${pkgdir}/opt/${pkgname}/"
    install -m 644 "snapshot_blob.bin" "${pkgdir}/opt/${pkgname}/"
    install -m 755 "StorageExplorer" "${pkgdir}/opt/${pkgname}/"
    install -m 755 "StorageExplorerExe" "${pkgdir}/opt/${pkgname}/"
    install -m 755 "StorageExplorerSnap" "${pkgdir}/opt/${pkgname}/"
    install -m 644 "v8_context_snapshot.bin" "${pkgdir}/opt/${pkgname}/"
    install -m 644 "vk_swiftshader_icd.json" "${pkgdir}/opt/${pkgname}/"
    cp -r "locales" "${pkgdir}/opt/${pkgname}/"
    cp -r "resources" "${pkgdir}/opt/${pkgname}/"

    # Symlink the application in /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/StorageExplorer" "${pkgdir}/usr/bin/StorageExplorer"
    ln -s "/opt/${pkgname}/StorageExplorerExe" "${pkgdir}/usr/bin/StorageExplorerExe"

    
    # Add the icon and desktop files
    install -D -m644 "resources/app/out/app/icon.png" "${pkgdir}/usr/share/icons/StorageExplorer.png"
    install -D -m644 "StorageExplorer.desktop" "${pkgdir}/usr/share/applications/StorageExplorer.desktop"

    # Install the license file
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
