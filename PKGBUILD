# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-sudden-strike-4-finland_winter_storm
pkgver=1.15
_pkgtag=$pkgver
pkgrel=1
pkgdesc="The Finland Winter Storm add-on for Sudden Strike 4 centers around the most iconic Finnish vs. Soviet military conflicts during World War II."
arch=('x86_64')
url="https://www.gog.com/game/$(echo ${pkgname//-/_} | cut -c 5-)"
license=('custom')
groups=('gog-sudden-strike-4-dlcs')
makedepends=('lgogdownloader')
depends=("gog-sudden-strike-4>=$pkgver")
source=("$(echo ${pkgname//-/_} | cut -c 5-)_${pkgver//./_}.sh::gogdownloader://1937377674/en3installer0")
sha512sums=('6933da827ad9de5332f08562511ecfe757a07b396cb319c95646ea02e48026ab16888fc2a027d2d79bbe9ee36d9f11a65326eed68e90108f22a1153bd07b0b42')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

package()
{
  mkdir -p "${pkgdir}/opt/gog-sudden-strike-4/AssetBundles"
  mv "${srcdir}/data/noarch/game/AssetBundles" "${pkgdir}/opt/gog-sudden-strike-4/"
	chmod -R 644 "${pkgdir}/opt/gog-sudden-strike-4"
	find "${pkgdir}/opt/gog-sudden-strike-4" -type d -exec chmod 755 {} \;
	install -Dm 644 "${srcdir}/data/noarch/docs/"*"/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
