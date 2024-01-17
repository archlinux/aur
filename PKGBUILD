# Maintainer: Oliver Kahrmann <oliver.kahrmann@gmail.com>
# Contributor: David Baum <david.baum@naraesk.eu>
pkgname=eclipse-installer
pkgver=2020.03
pkgrel=3
pkgdesc="Automates the installation and update of Eclipse development environments"
arch=('i686' 'x86_64')
url="https://wiki.eclipse.org/Eclipse_Installer"
license=("EPL")
depends=("java-runtime>=8" "unzip" "webkit2gtk")
options=(!strip)
source=(
	'https://mirrors.dotsrc.org/eclipse//oomph/epp/2020-03/R/eclipse-inst-linux64.tar.gz'
	'eclipse-installer.desktop'
)
sha1sums=(
	'07123867ddd4f683747f37cca9ea7e8dc3f16e65'
	SKIP
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
