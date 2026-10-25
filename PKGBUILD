# Maintainer: Stipe Kotarac <stipe@kotarac.net>
pkgname=terplus
pkgver=1.3.0
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
b2sums=('5b9a822ed504ad3aa2e7527392501138776c08c5af1323541b09737b3ea4662675909ec4b44da3fd3e21e80d73a023ba15461d903507c95e5d8eb88c080c4441'
        'd78dbfe8bf77e5a7643b216d21c916473e9315ab0420b198090594af6430c1d73f5d049316e2280907b2b0419e782d39a5c82fbffd0d5e36c0951b7ab42a5311'
        '77f2264e7640b93567a5e8393b928f51a4ad658472ef5d8d67dd8e9d500f65af3ae88b31507506d8eb09bb582f062790c509dd17d210887eca5f6b67c712b625')

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
