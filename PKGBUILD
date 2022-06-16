# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=omnispeak-data
pkgver=1
pkgrel=1
pkgdesc="Full game data from GOG for omnispeak"
arch=("any")
url="https://www.gog.com/en/game/commander_keen_complete_pack"
license=("custom")
makedepends=("innoextract")

# Acquire this file by visiting $url, buying the title, and downloading the
# offline installer to the same directory as this PKGBUILD.
source=("local://setup_commander_keen_1.4_(42493).exe")
sha256sums=("1c5322e3bc9e5c6be1295e981a310e47b1113d987e6be2720fe975c149b4cf41")

build() {
  innoextract "$srcdir/setup_commander_keen_1.4_(42493).exe" --output-dir "$srcdir/keen-data"
}

package() {
  for file in AUDIO.CK4 GAMEMAPS.CK4 EGAGRAPH.CK4; do
    install -Dm 644 "$srcdir/keen-data/KEEN4/$file" "$pkgdir/usr/share/omnispeak/keen4/$file"
  done

  for file in AUDIO.CK5 GAMEMAPS.CK5 EGAGRAPH.CK5; do
    install -Dm 644 "$srcdir/keen-data/KEEN5/$file" "$pkgdir/usr/share/omnispeak/keen5/$file"
  done

  install -Dm 644 "$srcdir/keen-data/tmp/EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"
}
