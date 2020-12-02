# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-sudden-strike-4-the-pacific-war
pkgver=1.15
_pkgtag=$pkgver
pkgrel=1
pkgdesc="The Pacific War add-on for Sudden Strike 4 throws you right into the conflict between the Allied Forces and the Imperial Japanese Army."
arch=('x86_64')
url="https://www.gog.com/game/$(echo ${pkgname//-/_} | cut -c 5-)"
license=('custom')
groups=('gog-sudden-strike-4-dlcs')
makedepends=('lgogdownloader')
depends=("gog-sudden-strike-4>=$pkgver")
source=("$(echo ${pkgname//-/_} | cut -c 5-)_${pkgver//./_}.sh::gogdownloader://1324401455/en3installer0")
sha512sums=('95de0b33862a75426ab69dc84948cfe6bc88bd4bdc1d9eeab4e80839bd924a0f7ad70f226f1b3e804c8e7f561610e6340e2bdb91c2cce4d2535a3f5d89bf8d88')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

package()
{
  mkdir -p "${pkgdir}/opt/gog-sudden-strike-4/AssetBundles"
  mv "${srcdir}/data/noarch/game/AssetBundles" "${pkgdir}/opt/gog-sudden-strike-4/"
	chmod -R 644 "${pkgdir}/opt/gog-sudden-strike-4"
	find "${pkgdir}/opt/gog-sudden-strike-4" -type d -exec chmod 755 {} \;
	install -Dm 644 "${srcdir}/data/noarch/docs/"*"/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
