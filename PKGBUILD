# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-stellaris-horizon-signal
pkgver=3.0.2
_pkgtag=$pkgver
pkgrel=1
pkgdesc="The free Horizon Signal DLC for the Stellaris game"
arch=('x86_64')
url="https://www.gog.com/game/stellaris_horizon_signal"
license=('custom')
groups=('gog-stellaris-dlcs' 'gog' 'games')
depends=("gog-stellaris>=$pkgver")
makedepends=('unzip' 'findutils' 'lgogdownloader')
source=("stellaris_horizon_signal_${pkgver//./_}.sh::gogdownloader://1490429179/en3installer0")
sha512sums=('318fc5ce6dee8a17c7444a11af8d61e9a16b4d6dbf07de7025c6999ac610fca17347ecba1e4ab28759f37a4abd7760480885244e9b341666014b6fe2ccd0543f')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

prepare()
{
  cd "${srcdir}"
  test -d "${srcdir}/stellaris" && rm -r "${srcdir}/stellaris"
  unzip -q -d stellaris stellaris_horizon_signal_${pkgver//./_}.sh || test $? -eq 1
}

package()
{
  mkdir -p "${pkgdir}/opt/gog-stellaris"
  cp -r "${srcdir}/stellaris/data/noarch/game" -T "${pkgdir}/opt/gog-stellaris"
  chmod -R 644 "${pkgdir}/opt/gog-stellaris"
  find "${pkgdir}/opt/gog-stellaris" -type d -exec chmod 755 {} \;
  install -Dm 644 "${srcdir}/stellaris/data/noarch/docs/Stellaris: Horizon Signal/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
