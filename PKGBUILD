# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>

pkgname=mathtime-professional
pkgver=2
pkgrel=1
pkgdesc='Custom-Designed Math Fonts for use with Times Fonts'
url='https://pctex.com/mtpro2.html'
arch=('any')
license=('custom')
depends=('texlive-core')
source=('local://mtp2fonts.zip.tpm')
sha256sums=('43d9b98f2015721fb934549f04ab623de56f26f848d2bdaf81a08871bd2201e6')

package() {
	install -m755 -d "$pkgdir/var/lib/texmf/arch/installedpkgs"
	install -m644 /dev/stdin "$pkgdir/var/lib/texmf/arch/installedpkgs/${pkgname}.pkgs" <<-EOF
		mtpro2 1
	EOF
	install -m644 /dev/stdin "$pkgdir/var/lib/texmf/arch/installedpkgs/${pkgname}.maps" <<-EOF
		Map mtpro2.map
	EOF
	
	install -m755 -d "$pkgdir/usr/share"
	cd texmf
	find . -type d -exec install -d -m755 "$pkgdir/usr/share/texmf-dist/"'{}' \;
	find . -type f -exec install -m644 '{}' "$pkgdir/usr/share/texmf-dist/"'{}' \;

	cd ..
	install -Dm644 EULA-MTPro2.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
