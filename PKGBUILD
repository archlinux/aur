# Maintainer: Oliver Kahrmann <oliver.kahrmann@gmail.com>
# Contributor: David Baum <david.baum@naraesk.eu>
pkgname=eclipse-installer
pkgver=2026.06
_pkgver=${pkgver/./-}
pkgrel=2
pkgdesc="Automates the installation and update of Eclipse development environments"
arch=('aarch64' 'x86_64')
url="https://wiki.eclipse.org/Eclipse_Installer"
license=("EPL")
depends=("webkit2gtk-4.1")
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
sha256sums=('046474ca8f94e2229d7a81c4b5a6d965f5b5788beef2b8eede0faa49777a3f8c')
sha256sums_aarch64=('70100294f335fb8759fbe58e9dfd321cdd5fe5262e9b9167cf26b34bc159716b')
sha256sums_x86_64=('f89fe0c54312459b44dbe716fe494d17a5da829fd055cc1a67a45861153173ce')

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
