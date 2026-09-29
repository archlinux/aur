# Maintainer: Stipe Kotarac <stipe@kotarac.net>
pkgname=terplus
pkgver=1.0.6
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
b2sums=('75f05582e82fe398f6d1be7ea77ff5ddb8bd379c7fe6a30ff4d57bde0f02f1752e186d3f1c93d3ced7403dc9a4704ddf204f6e480230add6177ddfc89ab8b05f'
        '42a10ae0e0ed7b08dd4e5543550d03db04d20796eb054a23f145108e575c9e116eecaf7b5880e9213ca15ef4ec4fe9523722b5687a659cbefca48f68552be91a'
        '960681d3eb890d4a8bd5573bd0a29c61381125fbfd6b2dc710f1ef9b2d90621a6b11559d962702027e05262d2f90dba5dfbe246268819d8b2cfe5fe93dc62bfe')

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
