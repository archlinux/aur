# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=doom1-wad
pkgver=1.9
pkgrel=2
pkgdesc="The Doom shareware IWAD (game data)"
arch=('any')
url="http://www.idsoftware.com/games/doom/doom-ultimate"
license=('custom')
source=(ftp://ftp.fu-berlin.de/pc/msdos/games/idgames/idstuff/doom/doom19s.zip \
        LICENSE)
sha256sums=('cacf0142b31ca1af00796b4a0339e07992ac5f21bc3f81e7532fe1b5e1b486e6'
            'fb21ac76f0192ef13c2c88b4d71b64a494552601e8fc91afcd2e8e2306c79c63')

prepare() {
  cd "$srcdir"

  cat DOOMS_19.1 DOOMS_19.2 > DOOMS_19.EXE
  unzip -o DOOMS_19.EXE DOOM1.WAD || return 1
}

package() {
  cd "$srcdir"

  install -Dm644 DOOM1.WAD "$pkgdir"/usr/share/games/doom/doom1.wad
  install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  mkdir -p "$pkgdir"/usr/share/doom
  ln -s /usr/share/games/doom/doom1.wad "$pkgdir"/usr/share/doom/doom1.wad
}
