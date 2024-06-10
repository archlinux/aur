# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: orumin <dev@orum.in>

# notice:
#
# BUILD INSTRUCTIONS:
# -------------------
#
# You can download MathTime Pro2 Lite font below:
#
# https://www.pctex.com/downloads.php?product=MTP2L
#
# if you have done downloaded, mtp2lite.zip.tpm place same as this PKGBUILD directory
# Then, uncomment source and md5sums

pkgname=tex-math-time-pro2-lite
pkgver=1.000
pkgrel=1
pkgdesc="TeX math commercial font (free version)"
arch=(any)
license=('custom')
url="https://www.pctex.com/mtpro2.html"
depends=(texlive-latex)
source=(local://mtp2lite.zip.tpm)
md5sums=('278045b67872ffab6767efff3f58c7ad')

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
  install -Dm644 EULA-MTPro2Lite.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
