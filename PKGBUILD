# Maintainer: Roberto Mora <cod378@proton.me>
pkgname=apidog2-bin
pkgver=2.8.23
pkgrel=1
pkgdesc="Design. Debug. Test. Document. Mock.Build APIs Faster & Together."
provides=('apidog')
arch=('x86_64')
url="https://apidog.com"
options=(!strip)
license=('custom')
depends=(nss libx11 gtk3 libxcb java-runtime alsa-lib lib32-glibc nodejs lib32-gcc-libs libdbusmenu-glib)
makedepends=(unzip)
source_x86_64=(
	"Apidog-${pkgver}.zip::https://file-assets.apidog.com/download/Apidog-linux-latest.zip"
	"apidog.desktop"
)
sha256sums_x86_64=('db02a5b4f3633b1255ade2877fdf5633034bf0e4c575ac914b7b3807cdeaef9a'
                   'df7ead28acf1b9ed171b08c4db34efbe0d1689bce594ccc68408e75af9cb8bc5')

package() {
    # Extract ZIP and AppImage
    unzip -o "Apidog-${pkgver}.zip"
    chmod +x Apidog.AppImage
    ./Apidog.AppImage --appimage-extract
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
