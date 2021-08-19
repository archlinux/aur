# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-stellaris-anniversary-portraits
pkgver=3.0.4.1
_pkgtag=$pkgver
pkgrel=1
pkgdesc="The free Anniversary Portraits DLC for the Stellaris game"
arch=('x86_64')
url="https://www.gog.com/game/stellaris_anniversary_portraits"
license=('custom')
groups=('gog-stellaris-dlcs' 'gog' 'games')
depends=("gog-stellaris>=$pkgver")
makedepends=('unzip' 'findutils' 'lgogdownloader')
source=("stellaris_anniversary_portraits_${pkgver//./_}.sh::gogdownloader://1619776270/en3installer0")
sha512sums=('ac3fe4bc05f594cd7bdd1e582849caa978588df415e2306eb7fc23cdb3bfd85d92dd36e1e87bb4d3446b0fd0b79a4b09571ac4127ac737771fa1565f8a9f7cb4')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

prepare()
{
  cd "${srcdir}"
  test -d "${srcdir}/stellaris" && rm -r "${srcdir}/stellaris"
  unzip -q -d stellaris stellaris_anniversary_portraits_${pkgver//./_}.sh || test $? -eq 1
}

package()
{
  mkdir -p "${pkgdir}/opt/gog-stellaris"
  cp -r "${srcdir}/stellaris/data/noarch/game" -T "${pkgdir}/opt/gog-stellaris"
  chmod -R 644 "${pkgdir}/opt/gog-stellaris"
  find "${pkgdir}/opt/gog-stellaris" -type d -exec chmod 755 {} \;
  install -Dm 644 "${srcdir}/stellaris/data/noarch/docs/Stellaris: Anniversary Portraits/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
