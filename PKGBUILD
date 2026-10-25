# Maintainer: Stipe Kotarac <stipe@kotarac.net>
pkgname=terplus
pkgver=1.2.0
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
b2sums=('8ada0cfcb0007dfa122135a680323c634fe6639876688707ed8bdd9a9b0da2073036b0998d821de9afac50a3dd5157f83c0b6db02c7116f4421eb13b9626baeb'
        '9c6bbf66cc2bd38cf4e2993f592e6750cc86d8a5b4cc0ae6c3dac30253901596fef5e8c4e87992abd3d41b16c889963930f365ec29c096e27c3d4386094eb349'
        '7b797e2872f25efe890380b4b4ff91ae638aaea7034ee379c119374439785d4cf6622e5c4b7621d9d42c4f445271956d6d7ed8a5792106eb4d83251cb8261d67')

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
