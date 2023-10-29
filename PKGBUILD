# Maintainer: nomisge <nomisge @ live . de>
# Contributor: chet <chetgurevitch @ protonmail . com>
# Contributor: saulhidalgoaular <saulhidalgoaular @ gmail . com>
# Contributor: teacher4711 <inverness1 @ gmx . de>
# Contributor: fheday <fheday @ gmail . com>
# Contributor: pyropeter <abi1789 @ gmail . com>
# Contributor: darkheart <fumbles @ ymail . com>
# Contributor: zerathidune <zerathidune @ gmail . com>

pkgname=bluej
pkgver=5.2.1
pkgrel=3
pkgdesc="A free Java Development Environment designed for beginners, used by millions worlwide."
arch=('any')
url="https://www.${pkgname}.org"
license=('GPL2' 'Apache' 'BSD' 'CDDL' 'CPL' 'custom')
depends=('gtk2' 'archlinux-java-run' 'java-runtime=17' 'java-environment=17' 'java-openjfx=17')
makedepends=('zstd')
source=("https://www.${pkgname}.org/download/files/BlueJ-linux-${pkgver//.}.deb"
        "${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}.xml")
sha256sums=('a462a2bfda0f86dff6e14ad77bfc0896ea36762bc9caf26acf3163b402b7b584'
            '11370ac770b4a45a67acfbc72008719b779cdd2b3c4dae2e22fc4ccce8137e2b'
            'a845f3997ce91cfb1eeb882f4a6e1e4408b7a7d7c2e164495b5a077bdf353e7f'
            'e05453bd791b34ab6cfd6b67250dd18210f47505344b7980ad28bf922c014772')

prepare() {
  cd "${srcdir}"
  echo "Extracting archive ..."
#  tar --use-compress-program=unzstd -xf data.tar.xz
  tar -xf data.tar.xz --exclude=usr/share/${pkgname}/jdk
  cd "usr/share/${pkgname}"
  find -type f -name "javafx-*" -delete
}
package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/examples"

  cp -r "usr/share/${pkgname}" "${pkgdir}/opt"
  #cp -r usr/share/doc/BlueJ/*/ "${pkgdir}/usr/share/doc/${pkgname}/examples"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
  install -Dm644 "usr/share/icons/hicolor/48x48/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -Dm644 "usr/share/icons/hicolor/256x256/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm644 usr/share/doc/BlueJ/README.TXT "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 usr/share/doc/BlueJ/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/doc/BlueJ/THIRDPARTYLICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/THIRDPARTYLICENSE"
}
