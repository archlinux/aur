# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=la-mulana-hib
pkgver=1.5.5.2
pkgrel=2
pkgdesc='A "Ruins Exploration Archaeological action game" in which the player seeks the "Anthropo-origin"'
url="http://la-mulana.com/en/"
license=('custom: commercial')
arch=('x86_64' 'i686')
depends=('sh')
depends_i686=('sdl2' 'openal')
depends_x86_64=('lib32-sdl2' 'lib32-openal')
source=("hib://LaMulanaSetup-2015-04-01.sh"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('e189640c264f4c560faa472d6c26834347c6913cc07c54056852d1ebf5240573'
            'a91456f76ff7dccbbd844089e8eac8e8fd85074239954949ad6ec7f421c55dc2'
            '52b9e0b04d696bb36d70ee9e19038f002d4aad54c46538aa0304577127bc5e21')
PKGEXT=".pkg.tar"

# You need to download the Humble Bundle file manually or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, hib-dlagent (https://aur.archlinux.org/packages/hib-dlagent/)
# can be used to download files. Add something like this in your makepkg.conf
# (you need to tweak the options to your needs):
# DLAGENTS+=('hib::/usr/bin/hib-dlagent -k $KEY -u $USER -p $PASS -o %o %u')
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=("hib::/usr/bin/echo %u - This is is not a real URL, you need to download the humble bundle file manually to \"$PWD\" or setup a hib:// DLAGENT. Read this PKGBUILD for more information.")

package() {
  install -d "$pkgdir"/opt/la-mulana
  # data
  cp -rup data/noarch/* "$pkgdir"/opt/la-mulana
  # binary
  install -m755 data/x86/LaMulana.bin.x86 "$pkgdir"/opt/la-mulana
  # launcher
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/la-mulana
  # .desktop entry
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/la-mulana.desktop
  install -d "$pkgdir"/usr/share/pixmaps
  ln -s /opt/la-mulana/Icon.png "$pkgdir"/usr/share/pixmaps/la-mulana.png
}
