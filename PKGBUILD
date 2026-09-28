# Maintainer: Stipe Kotarac <stipe@kotarac.net>
pkgname=terplus
pkgver=1.0.1
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
b2sums=('4d5c3c3ada36dfe271e350638fe646329313eb2de1e407809fafe6dcf4b89584d0e5d03f077afab655e1a3f726ccec2df0d3ad42e37e9b890b41afe42d6c6270'
        '9467f00c9f59d897193deb79bb15398e00e396752286609c8dc2f0168c6223a88713a82ecdabe24ec98a190e8a9fd58a6a4ac378fa8e3aa64d0523969563c9e3'
        '4ee20a1378e4461f78d32894dce59d6426121542704db9bb6641744821a9378ef3f9577b9e87c6eb9d77b62b16eac40067a89812fd9bfd90a335f696344f56c8')

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
