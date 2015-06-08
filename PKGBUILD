# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Zatherz <zatherz at linux dot pl>

pkgname=qt5ct
pkgver=0.12
pkgrel=1
pkgdesc="Qt5 Configuration Utility (requires Qt platform theme to be set to qt5ct)"
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php?content=168066"
license=('BSD')
depends=('qt5-base' 'qt5-svg' 'qt5-tools')
source=("${pkgname}-${pkgver}.tar.bz2::http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.bz2" 'COPYING.BSD')
install="${pkgname}.install"
sha256sums=('b7f9e8840db096b031680b0e35956436c2e7b5eb261b080ec9a1adb582a90b4f'
            '97a70f7e23db575a05c0feafa8e775c3c3e6eef71e4d8bbae0074ac09f4d1086')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake-qt5 ${pkgname}.pro 
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}/src/${pkgname}
    install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  
    cd ${srcdir}/${pkgname}-${pkgver}/src/${pkgname}/translations
    install -d ${pkgdir}/usr/share/qt5/translations
    install -Dm644 ${pkgname}_*.qm ${pkgdir}/usr/share/qt5/translations/
  
    cd ${srcdir}/${pkgname}-${pkgver}/src/${pkgname}-qtplugin
    install -Dm755 ./lib${pkgname}.so ${pkgdir}/usr/lib/qt/plugins/platformthemes/lib${pkgname}.so
    
    install -Dm644 "${srcdir}/COPYING.BSD" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
