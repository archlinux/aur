# Contributor: Maddie Mewmews <maddie at mewmews gay>
# Contributor: Jan Cholasta <grubber at grubber cz>
# Maintainer: Yauheni Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

pkgname=vkdoom-bin-nightly
pkgver=2024.09.03
pkgrel=1
pkgdesc='Feature centric port for all Doom engine games, with a focus on Vulkan and modern computers (nightly build)'
arch=('x86_64')
url='https://vkdoom.org/'
license=('BSD' 'GPL3' 'LGPL3')
depends=(alsa-lib
         bzip2
         flac
         gcc-libs
         glib2
         glibc
         lame
         libogg
         libsndfile
         libvorbis
         'libvpx>=1.13'
         mpg123
         opus
         pcre2
         sdl2
         'zmusic>=1.1.8')
makedepends=('desktop-file-utils')
optdepends=('blasphemer-wad: Blasphemer (free Heretic) game data'
            'chexquest3-wad: Chex Quest 3 game data'
            'doom1-wad: Doom shareware game data'
            'freedm: FreeDM game data'
            'freedoom: Freedoom game data'
            'gxmessage: crash dialog (GNOME)'
            'hacx-wad: HacX game data'
            'harmony-wad: Harmony game data'
            'heretic1-wad: Heretic shareware game data'
            'hexen1-wad: Hexen demo game data'
            'kdialog: crash dialog (KDE)'
            'strife0-wad: Strife shareware game data'
            'square1-wad: The Adventures of Square, Episode 1 game data'
            'urbanbrawl-wad: Urban Brawl: Action Doom 2 game data'
            'xorg-xmessage: crash dialog (other)')
provides=('vkdoom')
conflicts=('vkdoom' 'vkdoom-git')
source=('https://github.com/dpjudas/VkDoom/releases/download/nightly/vkdoom-linux-prerelease.zip'
        'vkdoom.sh'
        'vkdoom.desktop'
        'vkdoom.svg')
b2sums=('SKIP'
        '1c6437fb4964abe0724587681884e9211fe4d47d9767c6edcb5b3fb30102ab4b7824ea607ea3bcf5e2409fe944454a39a48783c661d2799236975405de10349e'
        '4129062d604c978682536d5d4cb00d1995a8a77b41235556614252f779882623b6babd46f3f9cb3544c62b67a4e9026c7bb68960c319f2cf32682535c43a2bed'
        'b9587a107c69dc98593f98454d411bcd69e9257b15d0d7d535c3afd19ce18b74a4513d67c7e973712768d60d1457dd5972d993cb84466d15525e26cf582cb105')

pkgver() {
    date +"%Y.%m.%d" --date='@'$(stat -c '%W' ./vkdoom-linux-prerelease/vkdoom)
}

package() {
    install "$srcdir"/vkdoom-linux-prerelease/* -D -m 644 -t "$pkgdir"/opt/vkdoom
    chmod +x "$pkgdir"/opt/vkdoom/vkdoom
    ln -s /usr/lib/libvpx.so "$pkgdir"/opt/vkdoom/libvpx.so.7

    desktop-file-install "$srcdir"/vkdoom.desktop --dir="$pkgdir"/usr/share/applications
    install "$srcdir"/vkdoom.svg -D -m 644 "$pkgdir"/usr/share/pixmaps/vkdoom.svg
    install "$srcdir"/vkdoom.sh -D -m 755 "$pkgdir"/usr/bin/vkdoom
}
