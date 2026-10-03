# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>

pkgname=mega
_pkgname=mega
pkgver=12.1.3
pkgrel=1
pkgdesc="Molecular Evolutionary Genetics Analysis. https://doi.org/10.1093/molbev/msy096"
arch=('x86_64')
url="https://megasoftware.net"
license=('custom')
depends=(
	'desktop-file-utils'
	'gconf'
	'gtk2'
	'hicolor-icon-theme'
)
source=("https://megasoftware.net/releases/mega_$pkgver-1_amd64.deb")
sha256sums=('01ddd94fb23e9f02a7423b1da8299c3b81df7f9e3c42fc6155e0514d2262f839')

package() {
	tar -I zstd -xpvf  data.tar.zst -C "${pkgdir}"
	chmod 755 -R ${pkgdir}/usr
	cp -r ${pkgdir}/usr/local/* ${pkgdir}/usr/
	rm -r ${pkgdir}/usr/local
	sed -i "s/Exec=mega/Exec=mega %U/g" $pkgdir/usr/share/applications/mega.desktop
}
