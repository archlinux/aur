# Maintainer: nomisge <nomisge @ live . de>

pkgname=bluej-preview
pkgver=5.0.0
pkgrel=1
pkgdesc="An integrated Java environment specifically designed for introductory teaching - Preview Version"
arch=('any')
url="https://www.${pkgname}.org"
license=('GPL2' 'Apache' 'BSD' 'CPL' 'LGPL2.1' 'MIT' 'custom')
depends=('archlinux-java-run' 'java-runtime=11' 'java-environment=11' 'java11-openjfx')
source=("https://www.bluej.org/download/files/BlueJ-linux-${pkgver//.}preview.deb"
        "${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}.xml")
noextract=("BlueJ-linux-${pkgver//.}preview.deb")
sha256sums=('26786aabb4c9eaf4e58e4803719c47d519a1878a7215f6d4541e910cabc80672'
            'c699ac24cc8fa48a920f9fbb056d0059f78cc90db371251d24f773fa57e71928'
            '565c74b8eca934d2991294e8205bf73e1b2950083ab74ea539f919a9d87df413'
            'e05453bd791b34ab6cfd6b67250dd18210f47505344b7980ad28bf922c014772')

package() {
cd "${srcdir}"
ar p "BlueJ-linux-${pkgver//.}preview.deb" data.tar.xz | tar xJ

mkdir -p "${pkgdir}/opt/${pkgname}"
mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/examples"

cp -r usr/share/bluej/* "${pkgdir}/opt/${pkgname}/"
cp -r usr/share/doc/BlueJ/*/ "${pkgdir}/usr/share/doc/${pkgname}/examples"

install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
install -Dm644 "${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
#install -Dm644 "usr/share/icons/hicolor/256x256/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
install -Dm644 usr/share/doc/BlueJ/README.TXT "${pkgdir}/usr/share/doc/${pkgname}/README"
install -Dm644 usr/share/doc/BlueJ/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
install -Dm644 usr/share/doc/BlueJ/THIRDPARTYLICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/THIRDPARTYLICENSE"
}
