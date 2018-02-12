# $Id$
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski at archlinux dot org>
# Contributor: Felipe Hommen <felibank at gmail dot com>
# Contributor: moostik <mooostik at gmail dot com>

pkgname=geogebra-5
pkgver=5.0.431.0
pkgrel=1
pkgdesc="Dynamic mathematics software with interactive graphics, algebra and spreadsheet"
arch=('any')
url='http://www.geogebra.org/'
license=('GPL3' 'CCPL:by-sa' 'CCPL:by-nc')
depends=('desktop-file-utils' 'gsl' 'hicolor-icon-theme' 'java-runtime=8'
         'shared-mime-info' 'xdg-utils')
makedepends=('gendesk')
provides=("${pkgname//-5/}")
conflicts=("${pkgname//-5/}")
source=("https://download.geogebra.org/installers/5.0/GeoGebra-Linux-Portable-${pkgver//./-}.tar.bz2"
        "https://static.geogebra.org/images/geogebra-logo.svg"
        "geogebra"
        "geogebra-mime.xml")

prepare() {
  gendesk -f -n --pkgname "${pkgname//-5/}" --pkgdesc "${pkgdesc}" \
          --name="GeoGebra" \
          --categories="Education;Science;Math" \
          --mimetypes="application/vnd.geogebra.file;application/vnd.geogebra.tool"
}

package() {
  cd "GeoGebra-Linux-Portable-${pkgver//./-}"

  install -Dm755 "${srcdir}/geogebra" "${pkgdir}/usr/bin/geogebra"
  install -dm755 "${pkgdir}/usr/share/geogebra"
  install "geogebra/"* -t "${pkgdir}/usr/share/geogebra/"

  install -Dm644 "${srcdir}/geogebra.desktop" "${pkgdir}/usr/share/applications/geogebra.desktop"
  install -Dm644 "${srcdir}/geogebra-logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/geogebra.svg"
  install -Dm644 "${srcdir}/geogebra-mime.xml" "${pkgdir}/usr/share/mime/packages/geogebra.xml"
}

sha512sums=('4b549f46a3f91c0beb4cba31a2eeb0efd4370288ef1036b934b59632cea09a3559f8e89bbe7f4702545a337ff6565db077d836913b51d801e89c70fe5a62d892'
            'a946acb8867f497c68ce6f8fff8172da4a43a9ca118aafcc5ac414318fd52c4bc6ada387bdfa296f0ff2e1d7411ae345b61197b4adaa3f54299aab837647df55'
            'f5d6f3fe17638f4521b0a00d6d077a5c509984bd8f7cb39c28e412b7384ec129c6595400e7ae4cb5ba05f1673eb46d8f6c56db1b4145afb35797a1d0a170965d'
            '415e73ff15524d5e81b05cf4c31241f4e21a4eedcef0a11e5af82423f9a7c2cbf632e9ee1e86b4cc60ebc566472462979a65cb7f3cfc9f94243fb545ac042a0f')
