# Maintainer: Oliver Kahrmann <oliver.kahrmann@gmail.com>
# Contributor: David Baum <david.baum@naraesk.eu>
pkgname=eclipse-installer
pkgver=2024.06
pkgrel=1
pkgdesc="Automates the installation and update of Eclipse development environments"
arch=('aarch64' 'x86_64')
url="https://wiki.eclipse.org/Eclipse_Installer"
license=("EPL")
depends=("java-runtime>=17" "unzip" "webkit2gtk")
options=(!strip)
source=(
	'eclipse-installer.desktop'
)
source_x86_64=(
    'https://mirrors.dotsrc.org/eclipse/oomph/epp/2024-06/R/eclipse-inst-linux64.tar.gz'
)
source_aarch64=(
    'https://mirrors.dotsrc.org/eclipse/oomph/epp/2024-06/R/eclipse-inst-linux-aarch64.tar.gz'
)
sha256sums=(
	'c7d6a0bd5dad627dd15ac9d7e6e04c8c8a4b811ce4b0744212a487bc4f6c0cdf'
)
sha256sums_x86_64=(
    '0a332e3d7f9acbc10a3ec0571eafd980386ed854d61cb3547d8018f2a47d9578'
)
sha256sums_aarch64=(
    '37741b5dada70186b1526d884e20b028ec5056d04b1c5a6dc7396f32d59f825a'
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
