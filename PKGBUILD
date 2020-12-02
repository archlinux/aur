# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-sudden-strike-4-battle_of_kursk
pkgver=1.15
_pkgtag=$pkgver
pkgrel=1
pkgdesc="The Battle of Kursk for Sudden Strike 4 throws you right in the Battle of Kursk - one of the largest tank battles of World War II! Command German and Soviet forces on the new skirmish map."
arch=('x86_64')
url="https://www.gog.com/game/sudden_strike_4_complete_collection"
license=('custom')
groups=('gog-sudden-strike-4-dlcs')
makedepends=('lgogdownloader')
depends=("gog-sudden-strike-4>=$pkgver")
source=("$(echo ${pkgname//-/_} | cut -c 5-)_${pkgver//./_}.sh::gogdownloader://1938212434/en3installer0")
sha512sums=('52244bc0a33c6696328cbf538f8f7c8088352bb9f00de27c6164adfa0a715788d7265158083589cb4896264e0e805461869d04bc515cc9c580de71e606768a3f')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

package()
{
  mkdir -p "${pkgdir}/opt/gog-sudden-strike-4/AssetBundles"
  mv "${srcdir}/data/noarch/game/AssetBundles" "${pkgdir}/opt/gog-sudden-strike-4/"
	chmod -R 644 "${pkgdir}/opt/gog-sudden-strike-4"
	find "${pkgdir}/opt/gog-sudden-strike-4" -type d -exec chmod 755 {} \;
	install -Dm 644 "${srcdir}/data/noarch/docs/"*"/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
