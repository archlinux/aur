# Maintainer: nomisge <nomisge @ live . de>

pkgname=bluej-preview
_pkgname=bluej
pkgver=5.5.0.rc2
pkgrel=2
pkgdesc="A free Java Development Environment designed for beginners, used by millions worlwide. Release Candidate with Kotlin Support"
arch=('x86_64')
url="https://www.${pkgname}.org"
license=('GPL2' 'Apache' 'BSD' 'CDDL' 'CPL' 'custom')
depends=('gtk3' 'archlinux-java-run' 'java-runtime=21' 'java-environment=21' 'java-openjfx=21')
makedepends=('gdown' 'unzip')
gdriveid="1wTuk1j3MMR4URhCQb1mLn_THpsaWyJm9"
DLAGENTS+=('gdown::./gdown-unzip.sh %u %o')
source=("BlueJ-linux-x64-${pkgver}.deb::gdown://${gdriveid}"
	"${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}.xml")
sha256sums=('dcf54b81d4e9a598f5133a38bc3ed716891dd5f76b793a6516abfc973c38afa2'
            '979be5105b27c8da9650130f59eb840b3d8849d4f04728872604347ebf483714'
            '565c74b8eca934d2991294e8205bf73e1b2950083ab74ea539f919a9d87df413'
            'e05453bd791b34ab6cfd6b67250dd18210f47505344b7980ad28bf922c014772')
prepare() {
  cd "${srcdir}"
  echo "Extracting archive ..."
  tar -xf data.tar.xz --exclude=usr/share/${_pkgname}/jdk
  rm -rf usr/share/${pkgname} && mv usr/share/${_pkgname} usr/share/${pkgname}
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
  install -Dm644 "usr/share/icons/hicolor/48x48/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -Dm644 "usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm644 usr/share/doc/BlueJ/README.TXT "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 usr/share/doc/BlueJ/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/doc/BlueJ/THIRDPARTYLICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/THIRDPARTYLICENSE"
}
