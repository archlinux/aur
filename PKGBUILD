# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=texlive-garamondx
pkgver=1.21
pkgrel=1
pkgdesc="URW Garamond No8 Adobe Type1 fonts from CTAN (for texlive)"
arch=('any')
license=('CUSTOM:alladin')
url=http://www.ctan.org/tex-archive/fonts/garamondx
depends=('texlive-core')
source=("garamondx.tds-$pkgver.zip::http://mirrors.ctan.org/install/fonts/garamondx.tds.zip" garamondx.maps)
sha256sums=('73f3da6da271108c56a3e7c7934cc3ee21b03392345b0650644e827e143c74f0'
            'b877fe27843497762b97608b0bf2dc9da7d9eb81fba6269dbac48bd7f70e495c')
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
