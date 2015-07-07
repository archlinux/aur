# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: bender02 at archlinux dot us
pkgname=urw-garamond
pkgver=1.0
pkgrel=9
pkgdesc="URW Garamond No8 Adobe Type1 fonts from CTAN (for texlive)"
arch=('any')
license=('CUSTOM:alladin')
url=("http://tug.ctan.org/pkg/urw-garamond")
depends=(texlive-core)
install=$pkgname.install
source=(http://mirror.ctan.org/fonts/urw/garamond.zip urw-garamond.maps LICENSE)
md5sums=('a60beaf12c12c69eeb8fdc82bd481949'
         'c8d3a18033c3ab511391862ae8dfd6f8'
         '26381247b9d120f68e6c3dae624d6484')

package() {
  cd "$srcdir"
  _texmf_root=usr/share/texmf-dist
  install -d -m755 "$pkgdir/var/lib/texmf/arch/installedpkgs"
  install -m 644 $pkgname.maps "$pkgdir/var/lib/texmf/arch/installedpkgs"
  install -d "$pkgdir/$_texmf_root/fonts/afm/urw/garamond"
  install -d "$pkgdir/$_texmf_root/fonts/type1/urw/garamond"
  install -m 644 garamond/*.afm "$pkgdir/$_texmf_root/fonts/afm/urw/garamond"
  install -m 644 garamond/*.pfb "$pkgdir/$_texmf_root/fonts/type1/urw/garamond"
  bsdtar -x --no-same-permissions -f garamond/ugm.zip -C "$pkgdir/$_texmf_root"
  rm -rf "$pkgdir/$_texmf_root/"{doc,dvips}
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

