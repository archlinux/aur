# Maintainer: nomisge <nomisge @ live . de>
# Contributor: chet <chetgurevitch @ protonmail . com>
# Contributor: saulhidalgoaular <saulhidalgoaular @ gmail . com>
# Contributor: teacher4711 <inverness1 @ gmx . de>
# Contributor: fheday <fheday @ gmail . com>
# Contributor: pyropeter <abi1789 @ gmail . com>
# Contributor: darkheart <fumbles @ ymail . com>
# Contributor: zerathidune <zerathidune @ gmail . com>

pkgname=bluej
pkgver=5.0.2
pkgrel=1
pkgdesc="A free Java Development Environment designed for beginners, used by millions worlwide."
arch=('any')
url="https://www.${pkgname}.org"
license=('GPL2' 'Apache' 'BSD' 'CPL' 'LGPL2.1' 'MIT' 'custom')
depends=('gtk2' 'archlinux-java-run' 'java-runtime=11' 'java-environment=11' 'java11-openjfx')
source=("https://www.${pkgname}.org/download/files/BlueJ-linux-${pkgver//.}.deb"
        "${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}.xml")
noextract=("BlueJ-linux-${pkgver//.}.deb")
sha256sums=('f6c59f55017fc028950ca0667ac32933ee411e31543ecce6e94d52809350f251'
            'c1bdaad64fcf45b1efac00e010d5f750c417d64896cde80b9b7c5745277422b8'
            'a845f3997ce91cfb1eeb882f4a6e1e4408b7a7d7c2e164495b5a077bdf353e7f'
            'e05453bd791b34ab6cfd6b67250dd18210f47505344b7980ad28bf922c014772')

package() {
cd "${srcdir}"
ar p "BlueJ-linux-${pkgver//.}.deb" data.tar.xz | tar xJ

mkdir -p "${pkgdir}/opt/${pkgname}"
mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/examples"

rm -R "usr/share/${pkgname}/javafx"
rm -R "usr/share/${pkgname}/jdk"

cp -r "usr/share/${pkgname}" "${pkgdir}/opt"
cp -r usr/share/doc/BlueJ/*/ "${pkgdir}/usr/share/doc/${pkgname}/examples"

install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
install -Dm644 "${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
install -Dm644 "usr/share/icons/hicolor/48x48/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
install -Dm644 "usr/share/icons/hicolor/256x256/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
install -Dm644 usr/share/doc/BlueJ/README.TXT "${pkgdir}/usr/share/doc/${pkgname}/README"
install -Dm644 usr/share/doc/BlueJ/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
install -Dm644 usr/share/doc/BlueJ/THIRDPARTYLICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/THIRDPARTYLICENSE"
}
