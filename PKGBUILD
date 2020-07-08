# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-stellaris-horizon-signal
pkgver=2.7.2
_pkgtag=$pkgver
pkgrel=1
pkgdesc="The free Horizon Signal DLC for the Stellaris game"
arch=('x86_64')
url="https://www.gog.com/game/stellaris_horizon_signal"
license=('custom')
groups=('gog-stellaris-dlcs')
depends=('gog-stellaris')
makedepends=('unzip' 'findutils')
source=("stellaris_horizon_signal_${pkgver//./_}_38578.sh::gogdownloader://1490429179/en3installer0")
sha512sums=('b53fbdbd8f0ceca8532db8bf8ae3a73fdb2bca0b7d059fb06c88b87aefa17a26c1d4f11a5d862efe210f2d3936c055a4764a61b34f636cd61bc9568c0f24131f')

prepare()
{
  cd "${srcdir}"
  test -d "${srcdir}/stellaris" && rm -r "${srcdir}/stellaris"
  unzip -q -d stellaris stellaris_horizon_signal_${pkgver//./_}_38578.sh || test $? -eq 1
}

package()
{
  mkdir -p "${pkgdir}/opt/gog-stellaris"
  cp -r "${srcdir}/stellaris/data/noarch/game" -T "${pkgdir}/opt/gog-stellaris"
  chmod -R 644 "${pkgdir}/opt/gog-stellaris"
  find "${pkgdir}/opt/gog-stellaris" -type d -exec chmod 755 {} \;
  install -Dm 644 "${srcdir}/stellaris/data/noarch/docs/Stellaris: Horizon Signal/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
