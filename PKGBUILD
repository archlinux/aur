# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# This is intended as a generic data package for open source Doom 3:
# BFG Edition engines.
#
# You must copy the base directory from Doom 3 BFG to the same
# directory as this PKGBUILD.
#
# The pkgver is from the ProductVersion of Doom3BFG.exe.  I don't know
# if it is the official version number or if there even is one.
#
# Due to file differences between the Steam and GOG.com releases in
# the *.lang files, the checksums are not compared.  We'll just assume
# if the rest of the files are OK, these are too.

pkgname=doom3bfg-data
pkgver=1.0.34.6456
pkgrel=2
pkgdesc="Doom 3: BFG Edition game files"
url="http://www.idsoftware.com/"
arch=('any')
# Can't find any license in the game files. Presumably your standard EULA stuff.
license=('custom')
source=(base.sha512 doom3bfg.png)
sha512sums=('b8b93ac414520c9f3cf34d412fa2ee0496887c1b487a6b21550a5624bd1a698b551db596b06508bc8b0ec6fa36ecae2f0e0c17d6ff8f3fd8439cbd3542b479f8'
            '7fd894b4f962b14798eb8802a0d7bb20e087958d3eff63aea743c2d205604614f4bd07911cfa32652198d80bf5859c4d212e5abf548fd09e664de842cc3dd886')

prepare() {
  ln -s "$startdir/base"

  sha512sum -c base.sha512 --quiet

  # Sanitizing if it was copied from NTFS or wherever.
  find -L base -type d -exec chmod 755 {} +
  find -L base -type f -exec chmod 644 {} +
}

package() {
  install -d "$pkgdir"/usr/share/games/doom3bfg
  install -Dm 644 doom3bfg.png "$pkgdir"/usr/share/icons/doom3bfg.png
  cp -a base/ "$pkgdir"/usr/share/games/doom3bfg
}
