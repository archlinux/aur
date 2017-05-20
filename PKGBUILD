# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>
# Contributor: Piotr Krzemiński <pio.krzeminski@gmail.com>

pkgname=qnapi
pkgver=0.2.3
pkgrel=1
pkgdesc="Qt5 client for downloading movie subtitles from NapiProjekt, OpenSubtitles, Napisy24"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/QNapi/${pkgname}"
license=('GPL')
depends=('qt5-base' 'libmediainfo' 'p7zip')
changelog=ChangeLog
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QNapi/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8debb6862e96e52e4060131b314d9b887051a646a4a57c87c0287f2655357046')

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
