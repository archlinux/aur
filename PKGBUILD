# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=texlive-garamondx
pkgver=1.20
pkgrel=3
pkgdesc="URW Garamond No8 Adobe Type1 fonts from CTAN (for texlive)"
arch=('any')
license=('CUSTOM:alladin')
url=http://www.ctan.org/tex-archive/fonts/garamondx
depends=('texlive-core')
source=("garamondx.tds-$pkgver.zip::http://mirrors.ctan.org/install/fonts/garamondx.tds.zip" garamondx.maps)
md5sums=('d81a2e0bc611480e58e414bf9585cc86'
         '80761a71120a9861400927b591ac463f')
noextract=("garamondx.tds-$pkgver.zip")

package() {
  _texmf_root=usr/share/texmf-dist
  _pkgsver=3${pkgver//./}0
  install -d "$pkgdir"/var/lib/texmf/arch/installedpkgs
  install -m644 "$srcdir"/garamondx.maps "$pkgdir"/var/lib/texmf/arch/installedpkgs
  echo "garamondx ${_pkgsver}" > \
       "$pkgdir"/var/lib/texmf/arch/installedpkgs/${pkgname}_${_pkgsver}.pkgs
  install -d "$pkgdir"/$_texmf_root/
  cd "$pkgdir"/$_texmf_root/
  bsdtar xf "$srcdir"/garamondx.tds-$pkgver.zip
  install -Dm644 "$pkgdir"/$_texmf_root/doc/fonts/garamondx/README \
	  "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  rm "$pkgdir"/$_texmf_root/doc/fonts/garamondx/README
}
