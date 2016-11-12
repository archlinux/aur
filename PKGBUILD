# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>
# Contributor: Piotr Krzemiński <pio.krzeminski@gmail.com>

pkgname=qnapi
pkgver=0.2.2
pkgrel=3
pkgdesc="Qt5 client for downloading movie subtitles from NapiProjekt, OpenSubtitles, Napisy24"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/QNapi/${pkgname}"
license=('GPL')
depends=('qt5-base' 'libmediainfo' 'p7zip')
changelog=ChangeLog
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QNapi/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d189150944b2524e06bec3215caf4aa8503ee4f2597954cba5c2568e4a3b8a92')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake-qt5 QMAKE_DEFAULT_INCDIRS="" ${pkgname}.pro
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make -j2
    make INSTALL_ROOT="${pkgdir}/" install
    mkdir -p ${pkgdir}/usr/share/{kde4/services,kservices5}/ServiceMenus/
    mv ${pkgdir}/usr/share/doc/${pkgname}/${pkgname}-scan.desktop                  ${pkgdir}/usr/share/kde4/services/ServiceMenus/${pkgname}-scan.desktop 
    mv ${pkgdir}/usr/share/doc/${pkgname}/${pkgname}-download.desktop              ${pkgdir}/usr/share/kde4/services/ServiceMenus/${pkgname}-download.desktop
    cp ${pkgdir}/usr/share/kde4/services/ServiceMenus/${pkgname}-scan.desktop      ${pkgdir}/usr/share/kservices5/ServiceMenus/${pkgname}-scan.desktop
    cp ${pkgdir}/usr/share/kde4/services/ServiceMenus/${pkgname}-download.desktop  ${pkgdir}/usr/share/kservices5/ServiceMenus/${pkgname}-download.desktop
}
