# Maintainer: chet <chetgurevitch @ protonmail . com>
# Contributor: teacher4711 <inverness1 @ gmx . de>
# Contributor: fheday <fheday @ gmail . com>
# Contributor: seishinryohosha <seishinryohosha @ gmail . com>
# Contributor: even <kessiapinheiro @ gmail . com>

pkgname=greenfoot
pkgver=3.1.0
pkgrel=5
pkgdesc="Allows easy development of two-dimensional graphical applications, such as simulations and interactive games."
arch=('x86_64')
url="https://www.${pkgname}.org"
license=('GPL2' 'Apache' 'BSD' 'CPL' 'LGPL2' 'LGPL2.1' 'MIT' 'custom')
depends=('sh' 'java-runtime' 'java-environment' 'java-openjfx')
source=("https://www.${pkgname}.org/download/files/Greenfoot-linux-${pkgver//.}.deb"
        "${pkgname}"
        "${pkgname}.desktop")
noextract=("Greenfoot-linux-${pkgver//.}.deb")
sha256sums=('edf1e727386217a299e9fcd57a6d5c60a724a811d90d7ddec5fa05cc28631695'
            'e1dc21a1a19dcaba1bc2bc0d5590ea928bad7441111d447f0a0010ceb19a164c'
            '14f2f06b8566cb2d5f6369303420e5e08d031b37a6c1e06da47b58b7ca4eaec0')

package() {
cd "${srcdir}"
ar p "Greenfoot-linux-${pkgver//.}.deb" data.tar.xz | tar xJ

mkdir -p "${pkgdir}/opt/${pkgname}"
mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"

cp -r "usr/share/${pkgname}" "${pkgdir}/opt"
cp -r usr/share/doc/Greenfoot/API "${pkgdir}/usr/share/doc/${pkgname}"
cp -r usr/share/doc/Greenfoot/scenarios "${pkgdir}/usr/share/doc/${pkgname}"

install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
install -Dm644 "usr/share/icons/hicolor/256x256/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
install -Dm644 usr/share/doc/Greenfoot/README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
install -Dm644 usr/share/doc/Greenfoot/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
install -Dm644 usr/share/doc/Greenfoot/THIRDPARTYLICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/THIRDPARTYLICENSE"
install -Dm644 usr/share/doc/Greenfoot/GREENFOOT_LICENSES.txt "${pkgdir}/usr/share/licenses/${pkgname}/GREENFOOT_LICENSES"
}
