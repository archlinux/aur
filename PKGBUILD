# Maintainer: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=ldraw-parts-library
pkgver=20121228
pkgrel=1
pkgdesc="A collection of LDraw-format CAD files representing many of LEGO bricks produced"
arch=(any)
url="http://www.ldraw.org/parts/latest-parts.html"
license=('CCPL: cc-by-2.0')
options=(!strip)
source=("http://www.ldraw.org/library/updates/complete.zip"
	"http://www.ldraw.org/library/official/LDConfig.ldr"
         "ldraw-parts-library.sh" "license")

package() {
  cd "${srcdir}/ldraw/"

  # Install data
  mkdir -p           "${pkgdir}/usr/share/ldraw"
  cp ../LDConfig.ldr "${pkgdir}/usr/share/ldraw/"
  mv p               "${pkgdir}/usr/share/ldraw/"
  mv parts           "${pkgdir}/usr/share/ldraw/"

  # Fix permissions
  find "${pkgdir}/usr/share/ldraw" -type f -exec chmod 644 {} +
  find "${pkgdir}/usr/share/ldraw" -type d -exec chmod 755 {} +

  # Install the old version 2.0 CC-by license
  install -D -m644 ../license                "${pkgdir}/usr/share/licenses/${pkgname}/license"

  install -D -m755 ../ldraw-parts-library.sh "${pkgdir}/etc/profile.d/ldraw-parts-library.sh"
}

md5sums=('e1aca2647a25f56a22042bc10fdbf0fd'
         'a6bf17c4a4258a56d029d7ed6b62bb79'
         '2acda6add7ed39994a710bd70aa96fc1'
         '8fca376070b84bea4d4c42c736a378de')
