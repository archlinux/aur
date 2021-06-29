# Maintainer: nomisge <nomisge @ live . de>
# Contributor: chet <chetgurevitch @ protonmail . com>
# Contributor: teacher4711 <inverness1 @ gmx . de>
# Contributor: fheday <fheday @ gmail . com>
# Contributor: seishinryohosha <seishinryohosha @ gmail . com>
# Contributor: even <kessiapinheiro @ gmail . com>

pkgname=greenfoot
pkgver=3.7.0
pkgrel=1
pkgdesc="Allows easy development of two-dimensional graphical applications, such as simulations and interactive games."
arch=('any')
url="https://www.${pkgname}.org"
license=('GPL2' 'Apache' 'BSD' 'CPL' 'LGPL2' 'LGPL2.1' 'MIT' 'custom')
depends=('archlinux-java-run' 'java-runtime=11' 'java-environment=11' 'java11-openjfx')
source=("https://www.${pkgname}.org/download/files/Greenfoot-linux-${pkgver//.}.deb"
        "${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}.xml")
noextract=("Greenfoot-linux-${pkgver//.}.deb")
sha256sums=('2bd7da53765aadc47883cae21e9a196151f4b17b6e7aa7e6dc5a3eb19007240f'
            'd9293f132cfee9d4f1c4471f697b841488da1a5fc9b7d5ef1a918bb665a1d1c4'
            'b980d0084fbafbb3ea335bb3840d858898c692822f1c671969a91982e86c1b4f'
            'f1ea33e8289dfe31b9a0c4d88482a5ca5f75d663ba82ca986519f290e44789e4')

package() {
cd "${srcdir}"
ar p "Greenfoot-linux-${pkgver//.}.deb" data.tar.xz | tar xJ --exclude=usr/share/${pkgname}/{javafx,jdk}

mkdir -p "${pkgdir}/opt/${pkgname}"
mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"

cp -r "usr/share/${pkgname}" "${pkgdir}/opt"
cp -r usr/share/doc/Greenfoot/API "${pkgdir}/usr/share/doc/${pkgname}"
cp -r usr/share/doc/Greenfoot/scenarios "${pkgdir}/usr/share/doc/${pkgname}"

install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
install -Dm644 "${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
install -Dm644 "usr/share/icons/hicolor/256x256/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
install -Dm644 usr/share/doc/Greenfoot/README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
install -Dm644 usr/share/doc/Greenfoot/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
install -Dm644 usr/share/doc/Greenfoot/THIRDPARTYLICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/THIRDPARTYLICENSE"
install -Dm644 usr/share/doc/Greenfoot/GREENFOOT_LICENSES.txt "${pkgdir}/usr/share/licenses/${pkgname}/GREENFOOT_LICENSES"
}
