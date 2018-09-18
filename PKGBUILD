# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=gnome-games-libretro
_srcname=gnome-games
pkgver=3.30.0
pkgrel=2
pkgdesc='Libretro definitions for gnome-games'
arch=('any')
license=('GPL3')
url='https://wiki.gnome.org/Apps/Games'
# libretro-cores is export-ignore in .gitattributes
source=("git+https://gitlab.gnome.org/GNOME/$_srcname.git#tag=$pkgver")
sha256sums=('SKIP')

package() {
  cd "$_srcname"
  install -d "$pkgdir"/usr/lib/libretro/
  install -t "$pkgdir"/usr/lib/libretro/ flatpak/libretro-cores/*.libretro

  # bsnes-mercury is available on the AUR, but doesn't build at the moment.
  # In general it's nice to provide the standard package as an option.
  cp "$pkgdir"/usr/lib/libretro/bsnes_mercury_balanced.libretro \
     "$pkgdir"/usr/lib/libretro/bsnes_balanced.libretro
  sed -i 's/bsnes-mercury/bsnes/;s/bsnes_mercury/bsnes/' \
    "$pkgdir"/usr/lib/libretro/bsnes_balanced.libretro
}
