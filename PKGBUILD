# Maintainer: Victor Queiroz <victorcqueirozg@gmail.com>
# makepkg consumes these fields and supplies srcdir/pkgdir when sourcing this file.
# shellcheck disable=SC2034,SC2154
pkgbase="lucidglyph"
pkgname=("lucidglyph" "fontconfig-curated-defaults")
pkgver=0.16.0
pkgrel=2
arch=("any")
pkgdesc="Carefully tuned adjustments designed to improve font rendering on Linux systems packaged for Arch Linux."
url="https://github.com/maximilionus/lucidglyph"
license=("GPL-3.0-only")
source=(
  "$pkgbase-$pkgver.zip::$url/archive/refs/tags/v$pkgver.zip"
  "59-curated-defaults.conf"
)
validpgpkeys=("265281061734E45F2BF0489803E9CD3D5C5D378E")
sha512sums=(
  "41fac46c8025e4373dda6499107cdc01c53672973726e7858e394e80c344a1f3c5e79145570ddd95f9c9fec360ede99c647e00bf8f8edefc3dbaf7890f7e2f8f"
  "61710d5e1ad93d8853ec05e3c8c912fd631bf1b424f32da0cb846bda021b069716d95aa14d59da2c206e57a61316c8ef00e9a4f589771c2f8e6b4a0c89fc8776"
)

package_lucidglyph() {
  depends=("fontconfig" "pam" "freetype2")
  optdepends=("fontconfig-curated-defaults: Curated defaults for generic font families")

  cd "$srcdir/$pkgbase-$pkgver/src/modules" || return 1

  install -d "$pkgdir/etc/fonts/conf.d"
  install -m644 fontconfig/*.conf "$pkgdir/etc/fonts/conf.d/"

  install -d "$pkgdir/etc/environment.d"
  install -m644 environment/*.conf "$pkgdir/etc/environment.d/"
}

package_fontconfig-curated-defaults() {
  pkgdesc="Curated Fontconfig defaults for generic font families, independent of lucidglyph"
  url="https://aur.archlinux.org/pkgbase/lucidglyph"
  depends=("fontconfig" "ttf-cascadia-code" "ttf-roboto")
  install="fontconfig-curated-defaults.install"

  install -Dm644 "$srcdir/59-curated-defaults.conf" \
    "$pkgdir/usr/share/fontconfig/conf.avail/59-curated-defaults.conf"
  install -d "$pkgdir/etc/fonts/conf.d"
  ln -s /usr/share/fontconfig/conf.avail/59-curated-defaults.conf \
    "$pkgdir/etc/fonts/conf.d/59-curated-defaults.conf"
}
