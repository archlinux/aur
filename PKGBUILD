# Maintainer: Oliver Kahrmann <oliver.kahrmann@gmail.com>
# Contributor: David Baum <david.baum@naraesk.eu>
pkgname=eclipse-installer
pkgver=2023.12
pkgrel=1
pkgdesc="Automates the installation and update of Eclipse development environments"
arch=('aarch64' 'x86_64')
url="https://wiki.eclipse.org/Eclipse_Installer"
license=("EPL")
depends=("java-runtime>=8" "unzip" "webkit2gtk")
options=(!strip)
source=(
	'eclipse-installer.desktop'
)
source_x86_64=(
    'https://mirrors.dotsrc.org/eclipse/oomph/epp/2023-12/R/eclipse-inst-linux64.tar.gz'
)
source_aarch64=(
    'https://mirrors.dotsrc.org/eclipse/oomph/epp/2023-12/R/eclipse-inst-linux-aarch64.tar.gz'
)
sha256sums=(
	'c7d6a0bd5dad627dd15ac9d7e6e04c8c8a4b811ce4b0744212a487bc4f6c0cdf'
)
sha256sums_x86_64=(
    'c26faafd1947c7e054bf36420416805813ea6bbb67ffb4a09c6025bb938c39c8'
)
sha256sums_aarch64=(
    'fbdf4c3aa89f97831f8617ce82262596cfac1bf82484170b0a2096dddf4cddd3'
)

package() {
    install -d ${pkgdir}/opt/${pkgname}
    cp -a "${srcdir}"/eclipse-installer/* "${pkgdir}"/opt/${pkgname}

    install -d "${pkgdir}"/usr/bin/
    ln -s /opt/${pkgname}/eclipse-inst "${pkgdir}"/usr/bin/${pkgname}

    install -d "${pkgdir}"/usr/share/icons/hicolor/256x256/apps
    ln -s "${srcdir}"/eclipse-installer/icon.xpm "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/eclipse-installer.xpm

    install -d "${pkgdir}"/usr/share/applications
    cp "${srcdir}"/eclipse-installer.desktop "${pkgdir}"/usr/share/applications/.

    install -d "${pkgdir}"/usr/share/doc/${pkgname}
    ln -s /opt/${pkgname}/readme/readme_eclipse.html "${pkgdir}"/usr/share/doc/${pkgname}/readme_eclipse.html
}
