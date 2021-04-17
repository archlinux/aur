# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-stellaris-horizon-signal
pkgver=3.0.1.2
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
sha512sums=('3a4d064a9940958e62f275c78152723d6c7387136e71d4810560544b228d9f25fb9bcfbd64c8526a042dc47fc425f118589a4a13a068c9878237a86f05f879a2')

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
