# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Claudio Kozicky, Yann Kaiser, mib1982

pkgname=cavestory+-hb
pkgver=1355961600
pkgrel=1
pkgdesc="A platformer adventure game set in a cave (humble bundle version)"
arch=('x86_64' 'i686')
url="http://nicalis.com/games.php?game=cavestory"
license=('custom: comercial')
depends=('sdl' 'glu')
conflicts=('cavestory+')
provides=('cavestory+')
options=('!strip')
source=("hib://cave_story_plus-linux-r100.tar.bz2"
        "cavestory+.sh"
        "cavestory+.desktop"
        "cavestory+.png")
sha256sums=('3eea507acdcf543393e9215d1d66b61a00d37a4e451294ab241a121fd4185bc8'
            '21af1b6df4bb8e599092201b102b5aae52f2c62789bcdd3e41c4d77fc7a8c7a0'
            '5d2d9d0ef17b2a798c89c12dafa4539a4275b7c703d7b3e3f2682af8608fcff7'
            'afed0ff2ec41d2b0272b5ce50f7497c7a43b3149a21a9444535d883f8525e816')
PKGEXT=.pkg.tar

# You need to download the Humble Bundle file manually to this directory ($PWD)
# or you can configure DLAGENTS in makepkg.conf to auto-download.
#
# For example, hib-dlagent (https://aur.archlinux.org/packages/hib-dlagent/)
# can be used to download files. Add something like this in your makepkg.conf
# (you need to tweak the options to your needs):
# DLAGENTS+=('hib::/usr/bin/hib-dlagent -k $KEY -u $USER -p $PASS -o %o %u')
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('hib::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%u",7)\ "\\"\ manually\\nor\ setup\ a\ hib://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

package() {
  # executable
  [ "$CARCH" == "x86_64" ] && install -Dm0755 CaveStoryPlus/CaveStory+_64 \
    "$pkgdir"/opt/CaveStoryPlus/CaveStory+
  [ "$CARCH" == "i686" ] && install -Dm0755 CaveStoryPlus/CaveStory+ \
    "$pkgdir"/opt/CaveStoryPlus/CaveStory+

  # data
  find CaveStoryPlus -name icon.bmp -prune \
    -o -name "CaveStory+*" -prune -o -name "lib*" -prune \
    -o -type f -exec install -Dm0644 {} "$pkgdir"/opt/{} \;

  # launcher
  install -Dm0755 cavestory+.sh "$pkgdir"/usr/bin/cavestory+

  # .desktop integration
  install -Dm0644 CaveStoryPlus/data/icon.bmp "$pkgdir"/usr/share/pixmaps/cavestory+.bmp
  install -Dm0644 cavestory+.png "$pkgdir"/usr/share/pixmaps/cavestory+.png
  install -Dm0644 cavestory+.desktop "$pkgdir"/usr/share/applications/cavestory+.desktop
}
