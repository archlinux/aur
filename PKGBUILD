# Maintainer: Alexandre Andrade <alex.d.a_14@outlook.pt>
pkgname=apidog-bin
pkgver=2.6.2
pkgrel=1
pkgdesc="Design. Debug. Test. Document. Mock.Build APIs Faster & Together."
provides=('apidog')
arch=('x86_64')
url="https://apidog.com"
options=(!strip)
license=('custom')
depends=(nss libx11 gtk3 libxcb java-runtime alsa-lib lib32-glibc nodejs lib32-gcc-libs)
source_x86_64=(
	"Apidog-linux-manual-latest.tar.gz::https://file-assets.apidog.com/download/Apidog-linux-manual-latest.tar.gz"
	"apidog.desktop"
)
sha256sums_x86_64=('213679edbaaff533458e7b838cc3c6760434cd05a39bcd313f29295698de3268'
                   'df7ead28acf1b9ed171b08c4db34efbe0d1689bce594ccc68408e75af9cb8bc5')

package() {
    # Application
    install -dm755 "${pkgdir}/opt/"
    cp -r "apidog-${pkgver}" "${pkgdir}/opt/apidog"
    
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/apidog/apidog" "${pkgdir}/usr/bin/apidog"
    
    # Desktop file
    install -D -m644 "apidog.desktop" \
        "${pkgdir}/usr/share/applications/apidog.desktop"
    
    # Icon
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps"
    cp "${pkgdir}/opt/apidog/resources/app.asar.unpacked/dist/assets/logo.png" \
        "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/apidog.png"
}
