# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=gnome-games-libretro
_srcname=gnome-games
pkgver=3.30.2
pkgrel=1
pkgdesc='Libretro definitions for gnome-games'
arch=('any')
url='https://wiki.gnome.org/Apps/Games'
license=('GPL3')
makedepends=('git')
optdepends=(# Removed in 3.20.2 but still on master
            #'libretro-blastem: Sega Mega Drive support'
            'libretro-bsnes: Super Nintendo Entertainment System support'
            'libretro-bsnes-mercury-git: Alternative Super Nintendo Entertainment System support'
            # TODO: see if renaming module to desmume works
            #'libretro-desmume2015: Nintendo DS support'
            # Removed in 3.20.2 but still on master
            #'libretro-dosbox-git: MS-DOS support'
            'libretro-gambatte: Nintendo Game Boy/Game Boy Color support'
            'libretro-handy-git: Atari Lynx support'
            # Removed in 3.20.2 but still on master
            #'libretro-mame-git: Arcade support'
            # TODO: see if renaming module to beetle works
            #'libretro-mednafen-ngp: Neo Geo Pocket Color'
            #'libretro-mednafen-pce-fast: TurboGrafx support'
            # Removed in 3.20.2 but still on master
            #'libretro-mednafen-saturn-git: Sega Saturn support'
            #'libretro-mednafen-vb: Nintendo Virtual Boy support'
            #'libretro-mednafen-wswan: WonderSwan support'
            'libretro-mgba: Nintendo Game Boy Advance support'
            'libretro-nestopia: Nintendo Entertainment System support'
            'libretro-pcsx-rearmed-git: Sony PlayStation support'
            'libretro-picodrive-git: Sega Genesis/Master System/CD/32X/Pico support'
            # Missing package
            # Removed in 3.20.2 but still on master
            #'libretro-prboom: Doom support'
            'libretro-prosystem-git: Atari 7800 support'
            'libretro-stella-git: Atari 2600 support')
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
