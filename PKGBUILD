# Maintainer: Alexandre Andrade <alex.d.a_14@outlook.pt>
pkgname=apidog-bin
pkgver=2.6.7
pkgrel=1
pkgdesc="Design. Debug. Test. Document. Mock.Build APIs Faster & Together."
provides=('apidog')
arch=('x86_64')
url="https://apidog.com"
options=(!strip)
license=('custom')
depends=(nss libx11 gtk3 libxcb java-runtime alsa-lib lib32-glibc nodejs lib32-gcc-libs libdbusmenu-glib)
source_x86_64=(
	"Apidog-${pkgver}.AppImage::https://file-assets.apidog.com/download/${pkgver}/Apidog-${pkgver}.AppImage"
	"apidog.desktop"
)
sha256sums_x86_64=('e856926d0ae1aeea0e32a3fabc768afa35a64318e9d7cf859ac882b38fb8b948'
                   'df7ead28acf1b9ed171b08c4db34efbe0d1689bce594ccc68408e75af9cb8bc5')

package() {
    # Application
    chmod +x Apidog-${pkgver}.AppImage
    ./Apidog-${pkgver}.AppImage --appimage-extract
    install -dm755 "${pkgdir}/opt/"
    cp -r "squashfs-root" "${pkgdir}/opt/apidog"
    chmod -R 755 "${pkgdir}/opt/apidog"
    
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/apidog/apidog" "${pkgdir}/usr/bin/apidog"
    
    # Desktop file
    install -D -m644 "apidog.desktop" \
        "${pkgdir}/usr/share/applications/apidog.desktop"
    
    # Icon
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    cp "${pkgdir}/opt/apidog/apidog.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/apidog.png"
}
