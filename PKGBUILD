# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-stellaris-anniversary-portraits
pkgver=3.4.4.2
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
sha512sums=('5100fbe5507cf6bf59750ca179490f07944a35de980a8adf2c80082f41c132846b692797d9f690d7f499816411be2ef538be226a22a98c6c810a73e96f0aea37')

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
