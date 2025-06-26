# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>

pkgname=mega
_pkgname=mega
pkgver=12.0.13
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
source=("https://www.megasoftware.net/releases/mega_$pkgver-1_amd64_beta.deb")
sha256sums=('10b8383a78288af388499d751ac0ed3c48e795257a49dd9ac13de96372db21d2')

package() {
	tar -I zstd -xpvf  data.tar.zst -C "${pkgdir}"
	chmod 755 -R ${pkgdir}/usr
	cp -r ${pkgdir}/usr/local/* ${pkgdir}/usr/
	rm -r ${pkgdir}/usr/local
	sed -i "s/Exec=mega/Exec=mega %U/g" $pkgdir/usr/share/applications/mega.desktop
}
