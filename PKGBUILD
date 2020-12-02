# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-sudden-strike-4-africa-desert-war
pkgver=1.15
_pkgtag=$pkgver
pkgrel=1
pkgdesc="The Africa Desert War add-on for Sudden Strike 4 centers around some of the most notorious desert skirmishes in North Africa."
arch=('x86_64')
url="https://www.gog.com/game/$(echo ${pkgname//-/_} | cut -c 5-)"
license=('custom')
groups=('gog-sudden-strike-4-dlcs')
makedepends=('lgogdownloader')
depends=("gog-sudden-strike-4>=$pkgver")
source=("$(echo ${pkgname//-/_} | cut -c 5-)_${pkgver//./_}.sh::gogdownloader://1912059629/en3installer0")
sha512sums=('a4ba0abb75da66524d786fc624b8d40d32548d1c9627520dfcf6328e536f7928c9a2a30ae525b753f2b825d00027d3a0c60aa782762cfd3ffb7964bd3b91e876')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

package()
{
  mkdir -p "${pkgdir}/opt/gog-sudden-strike-4/AssetBundles"
  mv "${srcdir}/data/noarch/game/AssetBundles" "${pkgdir}/opt/gog-sudden-strike-4/"
	chmod -R 644 "${pkgdir}/opt/gog-sudden-strike-4"
	find "${pkgdir}/opt/gog-sudden-strike-4" -type d -exec chmod 755 {} \;
	install -Dm 644 "${srcdir}/data/noarch/docs/"*"/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
