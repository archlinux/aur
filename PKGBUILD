# Maintainer: nomisge <nomisge @ live . de>

pkgname=bluej-preview
pkgver=5.3.0
pkgrel=1
pkgdesc="An integrated Java environment specifically designed for introductory teaching - Preview Version"
arch=('any')
url="https://www.${pkgname}.org"
license=('GPL2' 'Apache' 'BSD' 'CDDL' 'CPL' 'custom')
depends=('gtk2' 'archlinux-java-run' 'java-runtime=17' 'java-environment=17' 'java-openjfx=17')
makedepends=('zstd')
source=("https://www.bluej.org/download/files/rc/BlueJ-linux-${pkgver}-rc1.deb"
        "${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}.xml")
sha256sums=('070827a6df3d528d2187c994b5cfa7e624425fd7d34f9deaca6c63624392adc3'
            '2c67336126c9114b2117635f1073d0da46a3792e6f0b83550fce2555678553f6'
            '565c74b8eca934d2991294e8205bf73e1b2950083ab74ea539f919a9d87df413'
            'e05453bd791b34ab6cfd6b67250dd18210f47505344b7980ad28bf922c014772')

prepare() {
  cd "${srcdir}"
  echo "Extracting archive ..."
#  tar --use-compress-program=unzstd -xf data.tar.xz
  tar -xf data.tar.xz --exclude=usr/share/bluej/jdk
  cd "usr/share/bluej"
  find -type f -name "javafx-*" -delete
}
package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/examples"

  cp -r "usr/share/bluej/." "${pkgdir}/opt/${pkgname}"
  #cp -r usr/share/doc/BlueJ/*/ "${pkgdir}/usr/share/doc/${pkgname}/examples"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
  install -Dm644 "usr/share/icons/hicolor/48x48/apps/bluej.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -Dm644 "usr/share/icons/hicolor/256x256/apps/bluej.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm644 usr/share/doc/BlueJ/README.TXT "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 usr/share/doc/BlueJ/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/doc/BlueJ/THIRDPARTYLICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/THIRDPARTYLICENSE"
}
