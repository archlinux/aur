# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-stellaris-anniversary-portraits
pkgver=3.2.2
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
sha512sums=('d0746838fa2994ebf142b862fe89df2a3c00943453eda7c0d729d4aad4008d3638f6a5fd7aa63b3cec6ea609aa3cf9684e55550dcf9860d4abfb4de5d061e311')

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
