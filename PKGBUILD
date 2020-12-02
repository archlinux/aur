# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-sudden-strike-4-road-to-dunkirk
pkgver=1.15
_pkgtag=$pkgver
pkgrel=1
pkgdesc="In the Road to Dunkirk add-on for Sudden Strike 4, relive battles leading up to one of the world‘s most daring military rescue missions."
arch=('x86_64')
url="https://www.gog.com/game/$(echo ${pkgname//-/_} | cut -c 5-)"
license=('custom')
groups=('gog-sudden-strike-4-dlcs')
makedepends=('lgogdownloader')
depends=("gog-sudden-strike-4>=$pkgver")
source=("$(echo ${pkgname//-/_} | cut -c 5-)_${pkgver//./_}.sh::gogdownloader://1589182480/en3installer0")
sha512sums=('da66f0319035ff3292889fb677dae339a6987f5bfa8b50f745e7a97c883bd7afb9b79c05a902d30895cd2e157c53f2d2b474b98c64d6bbfdb0b301a6f48920f9')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

package()
{
  mkdir -p "${pkgdir}/opt/gog-sudden-strike-4/AssetBundles"
  mv "${srcdir}/data/noarch/game/AssetBundles" "${pkgdir}/opt/gog-sudden-strike-4/"
	chmod -R 644 "${pkgdir}/opt/gog-sudden-strike-4"
	find "${pkgdir}/opt/gog-sudden-strike-4" -type d -exec chmod 755 {} \;
	install -Dm 644 "${srcdir}/data/noarch/docs/"*"/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
