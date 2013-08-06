# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# This is intended as a generic data package for open source Doom 3:
# BFG Edition engines.

# You must copy (not link!) the base directory from Doom 3 BFG to the
# same directory containing this PKGBUILD.

# The pkgver is from the ProductVersion of Doom3BFG.exe as downloaded
# from Steam (and viewed in winefile). Don't know if it is the
# official version number or if there even is one officially.

# Currently only supports English-language installations. Proper
# multilingual support may be difficult and help on achieving the goal
# would be much appreciated.

pkgname=doom3bfg-data
pkgver=1.0.34.6456
pkgrel=1
pkgdesc="Doom 3: BFG Edition game files"
url="http://www.idsoftware.com/"
arch=('any')
# Can't find any license in the game files. Presumably your standard EULA stuff.
license=('custom')
source=(base.sha256 doom3bfg.png)
sha256sums=('be5b2710d3890c9d1cfb9693003bce736b66d584d71dc56163c038181f939875'
            '8b7998805ca2bdb8ab8500963acf4fab46331f1c44dcdc17b3e930f2afe98961')
PKGEXT=".pkg.tar"

prepare() {
  cd "$srcdir"

  mv ../base .
  sha256sum -c base.sha256 --quiet

  # Sanitizing if it was copied from NTFS or wherever.
  find base -type f -exec chmod 644 {} \;
  find base -type d -exec chmod 755 {} \;
}

package() {
  cd "$srcdir"

  install -d "$pkgdir"/usr/share/games/doom3bfg

  # Some AUR bot will complain about this.
  install -Dm 644 doom3bfg.png "$pkgdir"/usr/share/icons/doom3bfg.png

  mv base "$pkgdir"/usr/share/games/doom3bfg
  find "$pkgdir"/usr/share/games/doom3bfg -exec chown root:root {} \;
}
