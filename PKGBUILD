# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-stellaris-anniversary-portraits
pkgver=2.7.2
_pkgtag=$pkgver
pkgrel=1
pkgdesc="The free Anniversary Portraits DLC for the Stellaris game"
arch=('x86_64')
url="https://www.gog.com/game/stellaris_anniversary_portraits"
license=('custom')
groups=('gog-stellaris-dlcs')
depends=('gog-stellaris')
makedepends=('unzip' 'findutils')
source=("stellaris_anniversary_portraits_${pkgver//./_}_38578.sh::gogdownloader://1619776270/en3installer0")
sha512sums=('a5fd89da943d3a81f06be1a0068fe4a9c1bd6523037b40e86676b78ab309a50f5016ec9c2fd3d50b6c4419ee5337d93d474f0792ed4795a37299f651369c145d')

prepare()
{
  cd "${srcdir}"
  test -d "${srcdir}/stellaris" && rm -r "${srcdir}/stellaris"
  unzip -q -d stellaris stellaris_anniversary_portraits_${pkgver//./_}_38578.sh || test $? -eq 1
}

package()
{
  mkdir -p "${pkgdir}/opt/gog-stellaris"
  cp -r "${srcdir}/stellaris/data/noarch/game" -T "${pkgdir}/opt/gog-stellaris"
  chmod -R 644 "${pkgdir}/opt/gog-stellaris"
  find "${pkgdir}/opt/gog-stellaris" -type d -exec chmod 755 {} \;
  install -Dm 644 "${srcdir}/stellaris/data/noarch/docs/Stellaris: Anniversary Portraits/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
