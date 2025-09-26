# Maintainer: Oliver Kahrmann <oliver.kahrmann@gmail.com>
# Contributor: David Baum <david.baum@naraesk.eu>
pkgname=eclipse-installer
pkgver=2025.09
_pkgver=${pkgver/./-}
pkgrel=1
pkgdesc="Automates the installation and update of Eclipse development environments"
arch=('aarch64' 'x86_64')
url="https://wiki.eclipse.org/Eclipse_Installer"
license=("EPL")
depends=("unzip" "webkit2gtk")
optdepends=(
    "java-runtime: Can optionally be used when installing Eclipse packages"
)
options=(!strip)
source=(
	'eclipse-installer.desktop'
)
source_x86_64=(
    "https://download.eclipse.org/oomph/epp/$_pkgver/R/eclipse-inst-jre-linux64.tar.gz"
)
source_aarch64=(
    "https://download.eclipse.org/oomph/epp/$_pkgver/R/eclipse-inst-jre-linux-aarch64.tar.gz"
)
sha256sums=('bb24472355cdd2dff1d9af45190d5fadf989f071458ff33a19e723b66fe85d84')
sha256sums_aarch64=('11a5278f807562c72dcfdc4b6651f2958d8057d81e601d10a852e99bdc6d54bd')
sha256sums_x86_64=('e0447c6ca0592ba9aeecf3fec5829152ae699fb281e07f6d3875f87b8eb2311f')

package() {
    install -d ${pkgdir}/opt/${pkgname}
    cp -a "${srcdir}"/eclipse-installer/* "${pkgdir}"/opt/${pkgname}

    install -d "${pkgdir}"/usr/bin/
    ln -s /opt/${pkgname}/eclipse-inst "${pkgdir}"/usr/bin/${pkgname}

    install -d "${pkgdir}"/usr/share/icons/hicolor/256x256/apps
    ln -s "${srcdir}"/eclipse-installer/icon.xpm "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/eclipse-installer.xpm

    install -d "${pkgdir}"/usr/share/applications
    cp "${srcdir}"/eclipse-installer.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop

    install -d "${pkgdir}"/usr/share/doc/${pkgname}
    ln -s /opt/${pkgname}/readme/readme_eclipse.html "${pkgdir}"/usr/share/doc/${pkgname}/readme_eclipse.html
}
