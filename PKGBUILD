# Maintainer: Stipe Kotarac <stipe@kotarac.net>
pkgname=terplus
pkgver=1.0.2
pkgrel=1
pkgdesc='Fork of Terminus with additional glyphs.'
arch=(any)
url='https://kotarac.github.io/terplus/'
license=(OFL-1.1)
source=(
  "https://github.com/kotarac/terplus/releases/download/v$pkgver/$pkgname-v$pkgver-otb.tar.zst"
  "https://github.com/kotarac/terplus/releases/download/v$pkgver/$pkgname-v$pkgver-pcf.tar.zst"
  "https://github.com/kotarac/terplus/releases/download/v$pkgver/$pkgname-v$pkgver-psf.tar.zst"
)
b2sums=('e95e1eb8a43699b31ed9e43b56ab1cf8a17596c69e41f209b8fefd7ab355f7826c0c7e61a47e781d4129169e27522fc0877636b7ed39141411ee25c51dd34049'
        '7763cae703352d86375f439a32ae51999a32c0a26eb3dce336d04fc92dc486c0f41d14d3cb05c3690067bdbcffb97c4ce103d30b298a548e72240cd620948261'
        '9e29750d540971b61cf3aed7157249761212222b870f2c049c67a33b0fb8058022b4d68695548aa90772b7bcf692be35ae715a1db77a9837a49741232bbb8030')

package() {
  local font
  install -d "$pkgdir/usr/share/kbd/consolefonts" "$pkgdir/usr/share/fonts/misc"
  for font in "$pkgname-v$pkgver-psf"/*.psf; do
    gzip -cn "$font" > "$pkgdir/usr/share/kbd/consolefonts/${font##*/}.gz"
  done
  for font in "$pkgname-v$pkgver-pcf"/*.pcf; do
    gzip -cn "$font" > "$pkgdir/usr/share/fonts/misc/${font##*/}.gz"
  done
  install -Dm644 -t "$pkgdir/usr/share/fonts/misc" "$pkgname-v$pkgver-otb"/*.otb
  install -Dm644 "$pkgname-v$pkgver-otb/75-yes-terplus.conf" "$pkgdir/usr/share/fontconfig/conf.avail/75-yes-terplus.conf"
  install -d "$pkgdir/usr/share/fontconfig/conf.default"
  ln -sr "$pkgdir/usr/share/fontconfig/conf.avail/75-yes-terplus.conf" "$pkgdir/usr/share/fontconfig/conf.default/75-yes-terplus.conf"
  install -Dm644 "$pkgname-v$pkgver-otb/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname-v$pkgver-otb/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
