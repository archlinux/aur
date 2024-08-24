#Maintainer: HEx_404 <HEx_404x at proton dot me>
pkgname=abdownloadmanager-bin
pkgver=1.0.7
pkgrel=1
pkgdesc="A Download Manager that speeds up your downloads"
arch=('x86_64')
url="https://abdownloadmanager.com/"
license=('Apache-2.0')
depends=(
    'glibc'
    'java-runtime'
    'zlib'
    'alsa-lib'
    'libglvnd'
    'libxi'
    'freetype2'
    'libxtst'
    'libxrender'
    'fontconfig'
    'libx11'
    'libxext'
    )
provides=('abdownloadmanager')
conflicts=('abdownloadmanager')
options=(!debug)
source=("https://github.com/amir1376/${pkgname%-bin}/releases/download/v${pkgver}/ABDownloadManager_${pkgver}_linux.deb")
md5sums=('0cf557606a12656a253e6600ec71cc2d')

package() {
    cd "${srcdir}"
    bsdtar -xvf "${srcdir}/data.tar.zst"
    rm -rf "${srcdir}/opt/abdownloadmanager/share/"
    install -dm755 "${pkgdir}/opt"
    cp --preserve=mode -r "${srcdir}/opt" "${pkgdir}/"

    install -dm755 "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/abdownloadmanager/lib/abdownloadmanager-ABDownloadManager.desktop" \
       "${pkgdir}/usr/share/applications/abdownloadmanager.desktop"
    sed -i 's/AB Download Manager/Network;/g' "${pkgdir}/usr/share/applications/abdownloadmanager.desktop"
    sed -i 's/Icon=\/opt\/abdownloadmanager\/lib\/ABDownloadManager.png/Icon=abdownloadmanager/g' "${pkgdir}/usr/share/applications/abdownloadmanager.desktop"
    sed -i 's/MimeType=/StartupNotify=false/g' "${pkgdir}/usr/share/applications/abdownloadmanager.desktop"
    sed -i "$ a StartupWMClass=com-abdownloadmanager-desktop-AppKt" "${pkgdir}/usr/share/applications/abdownloadmanager.desktop"
    sed -i "$ a GenericName=Download Manager" "${pkgdir}/usr/share/applications/abdownloadmanager.desktop"

    install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    cp "${srcdir}/opt/abdownloadmanager/lib/ABDownloadManager.png" \
       "${pkgdir}/usr/share/icons/hicolor/512x512/apps/abdownloadmanager.png"

    rm -f "${pkgdir}/opt/abdownloadmanager/lib/abdownloadmanager-ABDownloadManager.desktop"
    rm -f "${pkgdir}/opt/abdownloadmanager/lib/ABDownloadManager.png"
}
