# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-stellaris-anniversary-portraits
pkgver=2.8.1.2
_pkgtag=$pkgver
pkgrel=1
pkgdesc="The free Anniversary Portraits DLC for the Stellaris game"
arch=('x86_64')
url="https://www.gog.com/game/stellaris_anniversary_portraits"
license=('custom')
groups=('gog-stellaris-dlcs')
depends=("gog-stellaris>=$pkgver")
makedepends=('unzip' 'findutils' 'lgogdownloader')
source=("stellaris_anniversary_portraits_${pkgver//./_}.sh::gogdownloader://1619776270/en3installer0")
sha512sums=('a202f6f3e4a9f0ec5c40153a1286e1adae7e81742f0534046b29e3363ec36bd53f06c73768f44e2534efee9b19da96ce7b3a1ccaeb84f151ffae6486ac1434b4')

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
